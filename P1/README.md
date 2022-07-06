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
# "process < infile" or "> outfile"

# linux shell
```bash
find . -name "*.c"
iconv -f gbk -t utf-8 file.txt
date
ls -la
mkdir a.c
cd ..
echo string
which -a echo
wc -l a.c
grep int a.c
```