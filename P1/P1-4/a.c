#include <stdio.h>
#define A "aaaaaaaaaa"
#define TEN(A) A A A A A A A A A A
#define B TEN(A)
#define C TEN(B)
#define D TEN(C)
#define E TEN(D)
#define F TEN(E)
#define G TEN(F)
int main() { puts(G); }

// #define ARCH "x86-64"

// int main() {
// 	printf("The arch is " ARCH "\n");
// }
