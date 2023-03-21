	.intel_syntax noprefix
	.text
	.global _start
_start:
	xor rax, rax
	mov rbx, OFFSET [CALC_DATA_BEGIN]
loop_start:	
	cmp rbx, 0
	jz loop_done
	add rbx, 8
	jmp loop_start
loop_done:
	syscall
