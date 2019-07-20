section .data
msg db 'Hello, World', 0xa ;append \n no hello world
author db 'Vitor', 0xa
len equ $ - msg ;len é um nome constante vindo do equ e o $ significa o endereço atual e no caso é o byte após a msg e o $$ é o endereço do início da secção atual
lena equ $ - author

section .text
	global _start
_start:
	mov edx, len ;carrega o tamanho pro edx
	mov ecx, msg ;carrega a msg pro ecx
	mov ebx, 1 ;file descriptor, stdout
	mov eax, 4 ;syscall de write estilo printf
	int 0x80 ;chama o kernel
	imul edx, 0x0
	imul ecx, 0x0
	xor ebx, ebx
	mov ecx, lena
	mov edi, author
	mov ebx, 1
	mov eax, 4
	int 0x80
	mov eax, 1 ;syscall de saida estilo return 0
	int 0x80
