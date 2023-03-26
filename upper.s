	.intel_syntax noprefix
	.section .text
	.global UPPER_FRAG
comp:
	cmp BYTE PTR[rcx], 'z'
	jle ite
	
	
UPPER_FRAG:
	mov rcx, QWORD PTR[CALC_DATA_BEGIN+8]
loop_start:	
	cmp BYTE PTR[rcx], 0
	je loop_done
	inc rax
	cmp BYTE PTR[rcx], '`'
	jg comp
	add rcx, 1
	jmp loop_start
ite:
	sub BYTE PTR[rcx], 0x20
	add rcx, 1
	jmp loop_start

loop_done:
	add rbx, 8
	ret
