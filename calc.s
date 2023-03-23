	.intel_syntax noprefix
	.text
	.global _start
and:
	add rbx, 8
	call AND_FRAG
	ret
or:
	add rbx, 8
	call OR_FRAG
	ret
sum:
	add rbx, 8
	call SUM_FRAG
	ret
comp:
	cmp rbx, '|'
	je or
	cmp rbx, '&'
	je and
	cmp rbx, 'S'
	je sum
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
