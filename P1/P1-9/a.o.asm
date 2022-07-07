
a.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <foo>:
   0:	f3 0f 1e fa          	endbr64 
   4:	55                   	push   %rbp
   5:	48 89 e5             	mov    %rsp,%rbp
   8:	89 7d ec             	mov    %edi,-0x14(%rbp)
   b:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
  12:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  19:	eb 0a                	jmp    25 <foo+0x25>
  1b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  1e:	01 45 f8             	add    %eax,-0x8(%rbp)
  21:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  25:	8b 45 fc             	mov    -0x4(%rbp),%eax
  28:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  2b:	7e ee                	jle    1b <foo+0x1b>
  2d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  30:	5d                   	pop    %rbp
  31:	c3                   	retq   
