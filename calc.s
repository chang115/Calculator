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
	syscall
