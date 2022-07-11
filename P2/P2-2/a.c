// P2-2 : a.c
#define FORALL_REGS(_) _(X) _(Y) _(Z)
#define LOGIC X1 = !X && Y; \
              Y1 = !X && !Y; \
              Z1 = !Z;

#define DEFINE(X) static int X, X##1; // static variable initial to zero
#define UPDATE(X) X = X##1;
#define PRINT(X) printf(#X " = %d; ", X);

int main(void) {
  FORALL_REGS(DEFINE);
// -> DEFINE(X) DEFINE(Y)
// -> static int X, X1; static int Y, Y1;
  while(1) { // clock
    FORALL_REGS(PRINT); putchar('\n'); sleep(1);
    LOGIC;
    FORALL_REGS(UPDATE);
  }
}