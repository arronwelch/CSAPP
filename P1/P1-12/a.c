// P1-12 : a.c
void printptr(void *p) {
	printf("p = %p;   *p = %016lx\n", p, *(long *)p);
}
int x;
int main(int argc, char *argv[]) {
	printptr(main);     // code
	printptr(&main);
	printptr(&x);       // data
	printptr(&argc);    // stack
	printptr(argv);
	printptr(&argv);	// stack
	printptr(argv[0]);	// ./a.out
}
