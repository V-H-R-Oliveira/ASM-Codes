[SECTION .text]
	global _start

_start:
	jmp short ender

	starter:
	xor eax, eax ; limpeza nos registradores
	xor ebx, ebx
	xor edx, edx
	xor ecx, ecx

	mov al, 4 ; eax
	mov bl, 1 ; ebx
	pop ecx ; pega o endereço da string
	mov dl, 5 ; edx
	int 0x80

	xor eax, eax
	mov al, 1 ; eax
	xor ebx, ebx
	int 0x80

	ender:
		call starter
		db 'hello'
