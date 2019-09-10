[SECTION .data]
	greets db 'Displaying some message from shadow space:', 0xa, 0x0
	len equ $-greets
	msg db 'The message in the shadow space is: ', 0x0
	len2 equ $-msg

[SECTION .bss]
	output resb 35

[SECTION .text]
	global _start

shadow:
	align 4 ; alinha stack com 4 bytes
	
	mov [rsp], dword 0xd34db36b
	mov [rsp+0x4], dword 0xd34db357
	mov [rsp+0x8], dword 0xd34db35a
	mov [rsp+0xc], dword 0xd34db31f
	mov [rsp+0x10], dword 0xd34db371
	mov [rsp+0x14], dword 0xd34db356
	mov [rsp+0x18], dword 0xd34db358
	mov [rsp+0x1c], dword 0xd34db358
	mov [rsp+0x20], dword 0xd34db35a
	mov [rsp+0x24], dword 0xd34db34c
	mov [rsp+0x28], dword 0xd34db34b
	mov [rsp+0x2c], dword 0xd34db31f
	mov [rsp+0x30], dword 0xd34db34c
	mov [rsp+0x34], dword 0xd34db35a
	mov [rsp+0x38], dword 0xd34db351
	mov [rsp+0x3c], dword 0xd34db35b
	mov [rsp+0x40], dword 0xd34db31f
	mov [rsp+0x44], dword 0xd34db358
	mov [rsp+0x48], dword 0xd34db34d
	mov [rsp+0x4c], dword 0xd34db35a
	mov [rsp+0x50], dword 0xd34db35a
	mov [rsp+0x54], dword 0xd34db34b
	mov [rsp+0x58], dword 0xd34db34c
	mov [rsp+0x5c], dword 0xd34db31f
	mov [rsp+0x60], dword 0xd34db34b
	mov [rsp+0x64], dword 0xd34db350
	mov [rsp+0x68], dword 0xd34db31f
	mov [rsp+0x6c], dword 0xd34db346
	mov [rsp+0x70], dword 0xd34db350
	mov [rsp+0x74], dword 0xd34db34a
	mov [rsp+0x78], dword 0xd34db31f
	mov [rsp+0x7c], dword 0xd34db31e
	mov [rsp+0x80], dword 0xd34db31e
	mov [rsp+0x84], dword 0xd34db31e
	
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
		cmp ebx, 0x950
		jz display_shadow
		movsx r8, dword [rsp+rbx]
		xor r8d, 0xd34db33f 
		mov [output+r9], r8b
		add ebx, 0x4
		add r9d, 0x1
		jmp loop_section
	
    display_shadow:
		; some cleanup
		
		xor r8, r8
		xor rbx, rbx
		xor r9, r9
		mov [output+0x22], byte 0xa
		mov [output+0x23], byte 0x0

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
		push 35
		pop rdx
		syscall
	
	exit:
		push 60
		pop rax
		syscall
