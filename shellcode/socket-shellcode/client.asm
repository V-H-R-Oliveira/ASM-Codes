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

	mov al, 60
	xor rbx, rbx
	xor rdx, rdx
	xor rdi, rdi
	xor rsi, rsi
	syscall

	ender:
		call starter
		db 2,0,31,144,127,0,0,1,0,0,0,0,0,0,0,0

