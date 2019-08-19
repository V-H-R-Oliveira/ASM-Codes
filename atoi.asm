; simple atoi in asm

[SECTION .data]
	n db '1234'
	size equ $-n

[SECTION .bss]
	res resd 1

[SECTION .text]
	global _start

atoi:
	push rsi
	pop r9
	push rdi
	pop r10
	push rdx
	pop r8
	xor rsi, rsi
	xor rdi, rdi
	xor rdx, rdx
	xor rcx, rcx

	loop_label:
		xor rbx, rbx
		cmp rcx, r8
		jz end
		mov al, [r9+rcx]
		sub al, 0x30
		imul rbx, 10
		add rbx, rax
		mov [r10+rcx], rbx
		inc rcx
		jmp short loop_label
	end:
		xor r8, r8
		xor rax, rax
		xor rcx, rcx
		xor r9, r9
		xor r10, r10

_start:
	push n
	pop rsi
	push res
	pop rdi
	push size
	pop rdx
	call atoi

	push 1
	pop rax
	push 1
	pop rdi
	push res
	pop rsi
	push size
	pop rdx
	syscall

	push 60
	pop rax
	syscall
