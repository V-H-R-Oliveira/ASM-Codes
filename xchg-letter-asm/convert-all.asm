[SECTION .data]
	greets db 'Enter a string: ', 0x0
	len equ $-greets
	invalid_length db 'Size equal to 0', 0xa, 0x0
	len2 equ $-invalid_length
	final db 'Final string: ', 0x0
	len3 equ $-final

[SECTION .bss]
	w resd 10 ; 40 bytes

[SECTION .text]
	global _start

_start:
	push 1
	pop rax
	push 1
	pop rdi
	push greets
	pop rsi
	push len
	pop rdx
	syscall

	xor rax, rax
	xor rdi, rdi
	push w
	pop rsi
	push 40
	pop rdx
	syscall
	
	push rax
	pop r8
	mov [w+rax-1], byte 0x0
	sub rax, 1

	test al, al
	jz invalid_len

	xor rbx, rbx
	xor rdx, rdx

	parse_string:
		cmp bl, al
		je exib
		mov dl, byte [w+rbx]
		add bl, 1
		cmp dl, byte 0x41
		jl store
		cmp dl, byte 0x5a
		jg lower
		xor dl, 0x20

	store:
		mov [w+rbx-1], dl
		jmp parse_string

	lower:
		cmp dl, byte 0x61
		jl parse_string
		cmp dl, byte 0x7a
		jg parse_string
		xor dl, 0x20
		jmp store
	
	invalid_len:
		push 1
		pop rax
		push 1
		pop rdi
		push invalid_length
		pop rsi
		push len2
		pop rdx
		syscall
		
		jmp exit

	exib:
		push 1
		pop rax
		push 1
		pop rdi
		push final
		pop rsi
		push len3
		pop rdx
		syscall

		push 1
		pop rax
		push w
		pop rsi
		mov [rsi+r8-1], byte 0xa
		push r8
		pop rdx
		syscall

	exit:
		push 60
		pop rax
		syscall
