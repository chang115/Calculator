	.intel_syntax noprefix
	.section .text
	.global UPPER_FRAG
comp:
	cmp BYTE PTR[rbx], 'z'
	jge THEO
	
	
UPPER_FRAG:
	cmp BYTE PTR[rbx], 0
	je YIP
	inc rax
	cmp BYTE PTR[rbx], '`'
	jg comp
	inc rbx
	jmp UPPER_FRAG
THEO:
	sub BYTE PTR[rbx], 20
	add rbx, 1
	jmp UPPER_FRAG

YIP:
	add rbx, 8
	ret
