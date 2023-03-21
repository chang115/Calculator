	.intel_syntax noprefix
	.section .text
	#the following line makes the AND_FRAG symbol to be accessed outside of just this file.=
	.global AND_FRAG

AND_FRAG:
	#The and command updates the rax register with the bit wise and of the 8 byte quantity in therbx register
	and rax, QWORD PTR[rbx]
	#The add command updates the register rbx to equal the address of where in memory y is plus 8
	add rbx, 8
	#int3 signifies to stop running the file
	ret
