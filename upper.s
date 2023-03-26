	.intel_syntax noprefix
	.section .text
	.global UPPER_FRAG
comp:
	cmp BYTE PTR[r12], 'z'
	jle ite
	
	
UPPER_FRAG:
	mov r12, QWORD PTR[rbx]
loop_start:	
	cmp BYTE PTR[r12], 0
	je loop_done
	inc rax
	cmp BYTE PTR[r12], '`'
	jg comp
	add r12, 1
	jmp loop_start
ite:
	sub BYTE PTR[r12], 0x20
	add r12, 1
	jmp loop_start

loop_done:
	add rbx, 8
	ret
