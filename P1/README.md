# 编译器到底做了什么？
1. using vim new **a.c** the simplest c source file   
	```c
	// file : a.c in vim editor
	int main(){}
	```
2. Preprocessor
	```bash
	# sh/bash/zsh
	$ gcc a.c -E > a.i
	```
    > -E: Stop after the preprocessing stage; do not run the compiler proper.
3. Compiler
	```bash
	# sh/bash/zsh
	$ gcc -S a.c
	$ file a.s
	```
	> -S: Stop after the stage of compilation proper; do not assemble.
4. assembler
	```bash
	$ gcc -c a.c
	$ file a.o
	```
	> -c: Compile or assemble the source files, but do not link.
5. linker
	```bash
	$ gcc a.o -o a.out
	$ file a.out
	```
	> -o: Place output in file.   
6. loader
	```bash
	$ ./a.out
	```
7. other record:
	```bash
	$ gcc a.c -E > a.i
	$ gcc a.i -S > a.s
	$ gcc a.s -c > a.o
	$ file a.o
	$ gcc a.o -o a.out
	$ file a.out
	$ ./a.out
	$ echo $? # print last process return value
	$ vi a.out # open a.out with vim(I setting 'vi' alias to 'vim')
	:%!xxd # display file in hex format
	:set nowrap # display with no wrap(do not newline automatically)
	:q! # To exit the editor, without saving the changes.
	$ man gcc # manual gcc
	$ gcc --help | less # display gcc help information
	$ tldr gcc # using tldr display common usage
	$ gcc -S a.c
	$ gcc -c a.c
	$ tldr objdump
	$ objdump -d a.o > a.asm # convert machine code to assembly code
	$ vi a.s
	:vs a.asm
	```
# 进入C语言之前:预编译
- #include
```bash
vi a.c
```
```c
// file : a.c
int main(){
printf(
#include "a.inc"
);
}
```
```bash
# vim command mode 
:e a.inc # new file a.inc
```
```c
// file : a.inc
#include "b"
```
```bash
# vim command mode
:e b # new file b
```
```c
// file : b
"hello, world\n"
```
```bash
gcc a.c
./a.out
man ssh
/verbose # find verbose in ssh's manual
gcc a.c --verbose
sudo apt-get install gcc-multilib # install packge for 32-bit compile
gcc -m32 a.c
vi a.c
```
```c
// file : a.c
int main(){
printf(
#include <a.inc>
);
}
```
```bash
gcc a.c -I. # include current path './'
```
以下代码会输出什么？
```c
// #include <stdio.h>

extern int printf (const char *__restrict __format, ...);

int main(){
#if aa == bb // aa(null) equal to bb(null), like shell
	printf("Yes\n");
#else
	printf("No\n");
#endif
}
```
```bash
$ gcc -E a.c
$ vi $(fzf)
```
宏定义与展开   
P1-4:如何搞垮一个OJ系统,产生大量字符，占用OJ编译资源
```c
#define A "a a a a a a a a"
#define TEN(A) A A A A A A A A A A
#define B TEN(A)
#define C TEN(B)
#define D TEN(C)
#define E TEN(F)
#define F TEN(E)
#define G TEN(F)

int main() { puts(G); }

// #define ARCH "x86-64"

// int main() {
// 	printf("The arch is " ARCH "\n");
// }
```
P1-5:##纯文本拼接
```c
#define A sys ## tem
int main(){
	A("echo hello");
}
```
P1-6:如何恶搞C程序:
```c
// #include <stdbool.h>
#include <stdio.h>
#define true (__LINE__ % 2 != 0)

int main(){
	if (true) printf("yes %d\n", __LINE__);
	if (true) printf("yes %d\n", __LINE__);
	if (true) printf("yes %d\n", __LINE__);
	if (true) printf("yes %d\n", __LINE__);
	if (true) printf("yes %d\n", __LINE__);
	if (true) printf("yes %d\n", __LINE__);
	if (true) printf("yes %d\n", __LINE__);
	if (true) printf("yes %d\n", __LINE__);
	if (true) printf("yes %d\n", __LINE__);
	if (true) printf("yes %d\n", __LINE__);
}
```
P1-7:X-Macros   
宏展开: 通过复制、粘贴改变代码的形态
- 反复粘贴，直到没有宏可以展开为止
例子：X-Macros
```c
#define NAMES(X) \
	X(Tom) X(Jerry) X(Tyke) X(Spike)

int main() {
	#defien PRINT(x) puts("Hello, " #x "!");
	NAMES(PRINT)

	#defien PRINT1(x) puts("Goodbye, " #x "!");
	NAMES(PRINT1)
}
```
# 有趣的预编译
发生在实际编译之前
- 也称为元编程（meta programming)
	- gcc的预处理器同样可以处理汇编代码
	- C++中的模板元编程，Rust的macros; . . .   
Pros   
- 提供灵活的用法(X-macros)
- 接近自然语言的写法   
Cons   
- 破坏可读性IOCCC，程序分析(补全); . . .   
```c
// P1-8
#define L (
int main L ) {puts L "Hello, world");}
```
# 编译与链接
## 编译
一个不带优化的简易(理想)编译器
- C代码的连续一段总能找到对应的一段连续的机器指令
	- 这就是为什么大家会觉得C是高级的汇编语言！
```c
// P1-9 : a.c
int foo(int n) {
	int sum = 0;
	for (int i = 1; i <= n; i++) {
		sum += i;
	}
	return sum;
}
```   
```bash
$ gcc -S a.c # compile only
$ file a.s
$ gcc -c a.o # assembly only
$ file a.o
$ objdump -d a.o > a.o.asm # object code to assembly code
```
```c
// P1-9 : b.c
int foo(int);
int main() {
	printf("sum = %d\n", foo(100));
}
```
```bash
$ gcc -c b.c # compile and assembly
$ objdump -d b.o | less # object code to assembly code
$ gcc a.o b.o -static # static linked file a.o and b.o
$ ./a.out # run the object file
$ objdump -d a.out | less #dispaly object file
```

## 链接
将多个二进制目标代码拼接在一起
- C中称为编译单元(compilation unit)
- 甚至可以链接C++, rust，. . . 代码
```c++
// P1-10 : C++
extern "C" { // compile in C style
	int foo() { return 0; }
}
int bar() { return 0; } // compilr in C++ style
```
```bash
$ g++ -c a.cc # compile only in C++
$ objdump -d a.o | less
```

## 加载 : 进入C语言的世界   
### C程序执行的两个视角   
---
**静态**:C代码的连续一段总能对应到一段连续的```机器指令```   
**动态**:C代码执行的状态总能对应到机器的状态   
- 源代码视角
	- 函数、变量、指针···
- 机器指令视角
	- 寄存器、内存、地址···   

两个视角的共同之处:内存   
- 代码、变量(源代码视角) = 地址 + 长度(机器指令视角)
- (不太严谨地)内存 = 代码 + 数据 + 堆栈
	- 因此理解C程序执行最重要的就是```内存模型```

### 从main函数开始执行
---
标准规定C程序从main开始执行   
- (思考题 谁调用的main?进程执行的第一条指令是什么?)
	```c
	int main(int argc, char *argv[])
	```
- argc(argument count) 参数个数
- argv(argument vector) 参数列表(NULL结束)   
> 上次课已经演示过
- ls -al (argc = 2, argv = ["ls", "-al", NULL])
### main, argc 和 argv
---
**一切皆可取地址**
```c
// P1-11 : a.c
int main() {
	int *p = (int *) 0;
	*p = 1;
	printf("Hello, World!\n");
}
```
```bash
$ gcc a.c && ./a.out
```
```c
// P1-12 : a.c
void printptr(void *p) {
	printf("p = %p;   *p = %016lx\n", p, *(long *)p);
}
int x;
int main(int argc, char *argv[]) {
	printptr(main);
	printptr(&main);
	printptr(&x);
	printptr(&argc);
	printptr(argv);
	printptr(&argv);
	printptr(argv[0]);
}
```
```bash
$ gcc a.c && a.out
$ cat a.c
$ objdump -d a.out | less
```
### C Type System
---
```类型``` : 对一段内存的解读方法
- 非常“汇编”———没有class, polymorphism,type traits,···   
- C里所有的数据都可以理解成是地址(指针) + ```类型(对地址的解读)```
> 例子(是不是感到学了假的C语言)
```c
// P1-13 : a.c
#include <stdio.h>
#include <assert.h>

int main(int argc, char *argv[]) {
	int (*f)(int, char *[]) = main;
	if (argc != 0) {
		char ***a = &argv, *first = argv[0], ch = argv[0][0];
		printf("arg = \"%s\"; ch = '%c'\n", first, ch);
		assert(***a == ch);
		f(argc - 1, argv + 1);
	}
}
```
```bash
$ gcc a.c && ./a.out
$ ./a.out 1 2 3 4 hello
arg = "./a.out"; ch = '.'
arg = "1"; ch = '1'
arg = "2"; ch = '2'
arg = "3"; ch = '3'
arg = "4"; ch = '4'
arg = "hello"; ch = 'h'
```