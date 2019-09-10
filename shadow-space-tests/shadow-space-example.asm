[SECTION .data]
	greets db 'Displaying some message from shadow space:', 0xa, 0x0
	len equ $-greets
	msg db 'The message in the shadow space is: ', 0x0
	len2 equ $-msg

[SECTION .bss]
	output resb 6

[SECTION .text]
	global _start

shadow:
	align 4 ; alinha stack com 4 bytes
	mov [rsp], byte 0x56
	mov [rsp+4], byte 0x69
	mov [rsp+8], byte 0x74
	mov [rsp+12], byte 0x6f
	mov [rsp+16], byte 0x72
	jmp loop_section

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
	
	call shadow
	
	xor rbx, rbx
	xor r9, r9
	xor r8, r8

	loop_section:
		cmp bl, 0x14
		jz display_shadow
		movsx r8, byte [rsp+rbx]
		mov [output+r9], r8b
		add bl, 0x4
		add r9b, 0x1
		jmp loop_section

    display_shadow:
		; some cleanup
		xor r8, r8
		xor rbx, rbx

		push 1
		pop rax
		push 1
		pop rdi
		push msg
		pop rsi
		push len2
		pop rdx
		syscall

		push 1
		pop rax
		push output
		pop rsi
		mov [rsi+r9], byte 0xa
		push 6
		pop rdx
		syscall
	
	exit:
		push 60
		pop rax
		syscall
