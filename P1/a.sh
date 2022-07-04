gcc a.c -E > a.i
gcc a.i -S > a.s
gcc a.s -c > a.o
gcc a.o -o a.out
./a.out
