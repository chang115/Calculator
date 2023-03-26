	.intel_syntax noprefix
	.section .text
	.global UPPER_FRAG
comp:
	cmp BYTE PTR[rbx], 'z'
	jle ite
	
	
UPPER_FRAG:
	cmp BYTE PTR[rbx], 0
	je loop_done
	inc rax
	cmp BYTE PTR[rbx], '`'
	jg comp
	add QWORD PTR[rbx], 1
	jmp UPPER_FRAG
ite:
	sub BYTE PTR[rbx], 0x20
	add QWORD PTR[rbx], 1
	jmp UPPER_FRAG

loop_done:
	add rbx, 8
	ret
