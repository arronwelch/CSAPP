// #include <stdio.h>

extern int printf (const char *__restrict __format, ...);

int main(){
#if aa == bb
	printf("Yes\n");
#else
	printf("No\n");
#endif
}