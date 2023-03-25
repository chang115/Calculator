	.intel_syntax noprefix
	.section .text
	.global UPPER_FRAG
comp:
	cmp QWORD PTR[rbx], 'z'
	jge THEO
	
	
UPPER_FRAG:
	cmp QWORD PTR[rbx], 0
	je YIP
	inc rax
	cmp QWORD PTR[rbx], '`'
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
