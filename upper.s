	.intel_syntax noprefix
	.section .text
	.global UPPER_FRAG
comp:
	cmp rbx, 'z'
	jge THEO
	
	
UPPER_FRAG:
	cmp rbx, 0
	je YIP
	inc rax
	cmp rbx, '`'
	jg comp
	add rbx, 1
	jmp UPPER_FRAG
THEO:
	sub QWORD PTR[rbx], 32
	add rbx, 1
	jmp UPPER_FRAG

YIP:
	add rbx, 8
	ret
