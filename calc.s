	.intel_syntax noprefix
	.text
	.global _start
comp:
	cmp rbx, '|'
	je OR_FRAG
	cmp rbx, '&'
	je AND_FRAG
	cmp rbx, 'S'
	je SUM_FRAG
	ret
_start:
	xor rax, rax
	mov rbx, OFFSET [CALC_DATA_BEGIN]
loop_start:	
	cmp rbx, 0
	jz loop_done
	call comp
	jmp loop_start
loop_done:
	syscall
