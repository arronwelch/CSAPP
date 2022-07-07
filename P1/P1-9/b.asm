
b.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <main>:
   0:	f3 0f 1e fa          	endbr64 
   4:	55                   	push   %rbp
   5:	48 89 e5             	mov    %rsp,%rbp
   8:	bf 64 00 00 00       	mov    $0x64,%edi
   d:	e8 00 00 00 00       	callq  12 <main+0x12>
  12:	89 c6                	mov    %eax,%esi
  14:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 1b <main+0x1b>
  1b:	b8 00 00 00 00       	mov    $0x0,%eax
  20:	e8 00 00 00 00       	callq  25 <main+0x25>
  25:	b8 00 00 00 00       	mov    $0x0,%eax
  2a:	5d                   	pop    %rbp
  2b:	c3                   	retq   
