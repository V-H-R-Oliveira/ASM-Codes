section .data
	msg db 'Zara Ali', 0xa
	len equ $-msg

section .text
	global _start

_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, len
	int 0x80

	mov [msg], dword 'Nuha ali' ; Move Nuha pro lugar de Zara Ali

	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, len
	int 0x80

	mov [msg + 0x2], byte 'V'; tenta mover V pra lugar do h xD

	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, len
	int 0x80

	mov eax, 1
	xor ebx, ebx
	int 0x80
