	.intel_syntax noprefix
	.section .text
	#.global makes the OR_FRAG symbol accessable outside of this file
	.global OR_FRAG

OR_FRAG:
	#The or command updates the rax register with the bitwise or of the 8 byte quantity at rbx's location
	or rax, QWORD PTR[rbx]
	#The add command updates rbx to equal the address of where in memory y is plus 8
	add rbx, 8
	#The int3 command signifies for the file to stop running
	ret
