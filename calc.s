	.intel_syntax noprefix
	.text
	.global _start
A:
	add rbx, 8
	call AND_FRAG
	ret
O:
	add rbx, 8
	call OR_FRAG
	ret
S:
	add rbx, 8
	call SUM_FRAG
	ret
comp:
	cmp QWORD PTR[rbx], '|'
	je O
	cmp QWORD PTR[rbx], '&'
	je A
	cmp QWORD PTR[rbx], 'S'
	je S
	ret
_start:
	xor rax, rax
	mov rbx, OFFSET [CALC_DATA_BEGIN]
loop_start:	
	cmp QWORD PTR[rbx], 0
	jz loop_done
	call comp
	jmp loop_start
loop_done:
	mov rax, 1
	mov rdi, 1
	mov rsi, QWORD PTR[rax]
	mov rdx, 8
	syscall

	mov rax, 1
	mov rdi, 1
	mov rsi, QWORD PTR[SUM_POSITIVE]
	mov rdx, 8
	syscall

	mov rax, 1
	mov rdi, 1
	mov rsi, QWORD PTR[SUM_NEGATIVE]
	mov rdx, 8
	syscall

	mov rcx, CALC_DATA_BEGIN
	mov rsp, CALC_DATA_END
	sub rsp, rcx
	mov rax, 1
	mov rdi, 1
	mov rsi, QWORD PTR[CALC_DATA_BEGIN]
	mov rdx, QWORD PTR[rsp]
	syscall
