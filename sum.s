	.intel_syntax noprefix
	#data section
	.section .data
	#making both symbols accessible for make
	.global SUM_POSITIVE
	.global SUM_NEGATIVE
	#providing symbols and associated memory
	.comm SUM_POSITIVE, 8, 8
	.comm SUM_NEGATIVE, 8, 8
	#text section
	.section .text
	.global SUM_FRAG

SUM_FRAG:
	add rax, QWORD PTR [rbx] #adding value of rbx to rax register
	cmp QWORD PTR [rbx], 0  #value of rbx - 0 to check if pos or neg
	jl is_neg   #jump to neg if negative value
	mov rcx, QWORD PTR [rbx]   #move value of rbx into rcx register
	add QWORD PTR [SUM_POSITIVE], rcx   #add value of rcx into pos symbol
	jmp done_cond #end cond
is_neg:
	mov rcx, QWORD PTR [rbx]  #move value of rbx into rcx register
	add QWORD PTR [SUM_NEGATIVE], rcx  #add rcx value into neg symbol
done_cond:
	add rbx, 8  #add 8 to rbx value
	ret
