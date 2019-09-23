[SECTION .text]
    global _start

_start:

    push 0xa
    pop r8
    push 0xa
    pop r9

    imul r8, r9
    push 0x65
    pop r10

    cmp r8, r10
    cmovb r8, r10

    push 60
    pop rax
    syscall