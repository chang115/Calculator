	.intel_syntax noprefix
	.section .text 
	.global _start
U:
	add rbx, 8
	call UPPER_FRAG
	ret
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
	cmp QWORD PTR[rbx], 'U'
	je U
	
_start:
	xor rax, rax
	mov rbx, OFFSET [CALC_DATA_BEGIN]
loop_start:	
	cmp QWORD PTR[rbx], 0
	jz loop_done
	call comp
	jmp loop_start
loop_done:
	mov QWORD PTR[pointer], rax
	mov rax, 1
	mov rdi, 1
	mov rsi, OFFSET[pointer]
	mov rdx, 8
	syscall

	mov rax, 1
	mov rdi, 1
	mov rsi, OFFSET[SUM_POSITIVE]
	mov rdx, 8
	syscall

	mov rax, 1
	mov rdi, 1
	mov rsi, OFFSET[SUM_NEGATIVE]
	mov rdx, 8
	syscall

	mov rax, 1
	mov rdi, 1
	mov rcx, OFFSET [CALC_DATA_BEGIN]
	mov rdx, OFFSET [CALC_DATA_END]
	mov rsi, OFFSET [CALC_DATA_BEGIN]
	sub rdx, rcx
	syscall

	mov rax, 60
	xor rdi, rdi
	syscall
	
	.section .data

pointer:
	.quad 0
