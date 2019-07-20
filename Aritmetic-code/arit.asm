segment.data
msg db  'Displaying 9 stars', 0xa
len equ $ - msg
op times 9 db '*'

%macro clean 0
	 sub edx, edx
	 sub ecx, ecx
	 xor ebx, ebx
	 mov eax, 0
%endmacro

segment.text
	global _start
_start:
	mov edx, len
	mov ecx, msg
	mov ebx, 1
	mov eax, 4
	int 0x80
	clean
	mov edx, 9
	mov ecx, op
	mov ebx, 1
	mov eax, 4
	int 0x80
	clean
	mov edx, 1
	mov ecx, 0xa
	mov ebx, 1
	mov eax, 4
	int 0x80
	clean
	mov eax, 1
	int 0x80
