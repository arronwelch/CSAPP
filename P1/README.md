# gcc process:
	- new **a.c** c source file
	> #include <stdio.h>
	> int main()
	> {
	> 	printf("Hello,CSAPP!\n");
	> 	return 0;
	> }
	- Preprocess:
	> gcc a.c -E > a.i
    > -E:Preprocess only;do not compile, assemble or link.
	- Compile:
	> gcc a.i -S > a.s
	> -S:Compile only; do not assemble or link.
	- assemble:
	> gcc a.s -c > a.o
	> -c:Compile and assemble, but do not link.
	- link
	> gcc a.o -o a.out
	> ./a.out
# pro <[infile] >[outfile]
# linux shell
	> find . -name "*.c"
	> iconv -f gbk -t utf-8 file.txt
	> date
	> ls -la
	> mkdir a.c
	> cd ..
	> echo string
	> which -a echo
	> wc -l a.c
	> grep int a.c
