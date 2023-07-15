= x86-64 Assembly

Encoded with `.ascii`.

```sh
as d.S -o d.o
ld d.o -o d.out
./d.out
```

Original code:
```asm
.globl _start
        .text
_start:
        mov $1, %rax
        mov $1, %rdi
        mov $msg, %rsi
        mov $10, %rdx
        syscall
        mov $60, %rax
        xor %rdi, %rdi
        syscall
msg:    .ascii "HelloWorld\0"
```
