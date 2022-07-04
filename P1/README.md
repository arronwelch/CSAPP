# 编译器到底做了什么？
1. using vim new **a.c** the simplest c source file   
	```vim
	int main(){}
	```
2. Preprocessor
	```bash
	gcc a.c -E > a.i
	```
    > -E: Stop after the preprocessing stage; do not run the compiler proper.
3. Compiler
	```bash
	gcc -S a.c
	vi a.s
	```
	> -S: Stop after the stage of compilation proper; do not assemble.
4. assembler
	```bash
	gcc -c a.c
	file a.o
	```
	> -c: Compile or assemble the source files, but do not link.
5. linker
	```bash
	gcc a.o -o a.out
	file a.out
	```
	> -o: Place output in file.   
6. loader
	```bash
	./a.out
	```
7. other record:
	```bash
	gcc a.c -E > a.i
	gcc a.i -S > a.s
	gcc a.s -c > a.o
	file a.o
	gcc a.o -o a.out
	file a.out
	./a.out
	echo $? # print last process return value
	vi a.out # open a.out with vim(I setting 'vi' alias to 'vim')
	:%!xxd # getting file in hex format
	:set nowrap # setting display with no wrap(newline automatically)
	:q! # To exit the editor, without saving the changes.
	man gcc # manual gcc
	gcc --help | less # display gcc help information
	tldr gcc # using tldr display common usage
	gcc -S a.c
	gcc -c a.c
	tldr objdump
	objdump -d a.o > a.asm # convert machine code to assembly code
	vi a.s
	:vs a.asm
	```
# 进入C语言之前:预编译
- #include

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