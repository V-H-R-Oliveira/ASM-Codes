[SECTION .text]
	global _start

_start:
	jmp short ender

	starter:
		push 1
		pop rax

		push 1
		pop rdi

		pop rbx
		push rbx
		pop rsi

		push 13
		pop rdx
		syscall

		push 60
		pop rax
		xor rbx, rbx
		xor rdx, rdx
		xor rdi, rdi
		xor rsi, rsi
		syscall
	ender:
		call starter
		db 'Hello world',0xa
