# C语言拾遗(2):编程实践
```本讲概述```
---
HW1 和 Lab1 已发布   
假设你已经熟练使用各种C语言机制(并没有)   
- 原则上给需求就能搞定任何代码(并不是)   

本次课程   
- 怎样写代码才能从一个大型项目里存活下来？
    - 核心准则: 编写可读代码
    - 两个例子

## 核心准则: 编写可读代码   

### 一个极端(不可读)的例子
---
[IOCCCII](https://www.ioccc.org/hou/hou.c) best self documenting program
- 不可读 = 不可维护
```c
    puts(
      usage: calculator 11/26+222/31
      +~~~~~~~~~~~~~~~~~~~~~~~~calculator-\
      !                          7.584,367 )
      +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+
      ! clear ! 0 ||l   -x  l   tan  I (/) |
      +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+
      ! 1 | 2 | 3 ||l  1/x  l   cos  I (*) |
      +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+
      ! 4 | 5 | 6 ||l  exp  l  sqrt  I (+) |
      +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+
      ! 7 | 8 | 9 ||l  sin  l   log  I (-) |
      +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~(0
    );
```
```bash
$ wget https://www.ioccc.org/hou/hou.c
$ gcc hou.c -lm # include library math
$ sudo apt-get upgrade -y
$ sduo apt-get install indent -y
$ gcc -E hou.c | indent --linux-style | pygmentize 
$ gcc -E hou.c | indent --linux-style > hou.format.c
```
### 一个现实中可能遇到的例子
人类不可读版(STFW： clockwise/spiral rule)
```c
void (*signal(int sig, void (*func)(int)))(int);

void (*signal(int sig,  func))(int);

void (*)(int);
```
人类可读版
```c
typedef void (*sighandler_t)(int);
sighandler_t signal(int, sighandler_t);
```
```bash
$ man 2 signal
```
### 编写代码的准则: 降低维护成本
Programs are meant to be read by humans and only
incidentally for computers to execute. —— D.E. Knuth   
(程序首先是拿给人读的，其次才是被机器执行。)   
```宏观```
- 做好分解和解耦(现实世界也是这样管理复杂系统的)
  - 有同学问: PA是否允许添加额外的文件？

```微观```
- “不言自明”
  - 通过```阅读代码```能理解一段程序是做什么的(specification)
- “不言自证”
  - 通过```阅读代码```能验证一段程序与specification的一致性

### 例子: 实现数字逻辑电路模拟器
---
假想的数字逻辑电路   
  - 若干个1-bit 边沿触发寄存器(X,Y,...)
  - 若干个逻辑门

你会如何设计？
  - 基本思路: 状态(存储)模拟 + 计算模拟
    - 状态 = 变量
      - int X = 0, Y = 0;
    - 计算
      - X1 = !X && Y;
      - Y1 = !X && !Y;
      - X = X1; Y = Y1;
```c
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
```
使用预编译: Good and Bad   

Good
  - 增加、删除寄存器只要改一个地方
  - 阻止了一些编程错误
    - 忘记更新寄存器
    - 忘记打印寄存器
  - “不言自明”还算不错   

Bad
  - 可读性变差(更不像C代码了)
    - “不言自证”还差一些
  - 给IDE解析带来一些困难

### 更完整的实现: 数码管显示
---
[logisim.c](http://jyywiki.cn/pages/ICS/2020/demos/logisim.c) 和 [display.py](http://jyywiki.cn/pages/ICS/2020/demos/display.py)

- 你也可以考虑增加诸如开关、UART等外设
- 原理无限接近大家数字电路课玩过的FPGA

```bash
$ wget http://jyywiki.cn/pages/ICS/2020/demos/logisim.c
$ wget http://jyywiki.cn/pages/ICS/2020/demos/display.py
$ chmod +x ./display.py # change mode add executable to file display.py
$ sudo apt-get install -y python3-tk # install tkinter for using turtle
$ gcc logisim.c && ./a.out | ./display.py
```

等等···FPGA?
- 这玩意不是万能的吗?
- 我们能模拟它，是不是就能模拟计算机系统?
  - Yes!
  - 我们实现了一个超级超级低配版NEMU!

### 例子: 实现YEMU全系统模拟器
教科书第一章上的“计算机系统”
- 存储系统
  - 寄存器: PC, R0(RA), R1, R2, R3 (8-bit)
  - 内存: 16字节（按字节访问）
- 指令集   
```
           7 6 5 4    3 2    1 0   
  mov     [0 0 0 0] [ rt ] [ rs ]   
  add     [0 0 0 1] [ rt ] [ rs ]   
  load    [1 1 1 0] [    addr   ]   
  store   [1 1 1 1] [    addr   ]   
```
有“计算机系统”的感觉了？

- 它显然可以用数字逻辑电路实现
- 不过我们```不需要在逻辑门电路层面实现它```
  - 我们接下来实现一个超级低配版NEMU···
