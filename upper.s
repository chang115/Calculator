	.intel_syntax noprefix
	.section .text           #section where code begins
	.global UPPER_FRAG       #makes UPPER_FRAG symbol accessible to all files
comp:
	cmp BYTE PTR[r12], 'z'   #compares byte value of r12 to ascii of character z
	jle ite                  #jumps to ite symbole if less than or equal too
	
	
UPPER_FRAG:
	mov r12, QWORD PTR[rbx]  #moves value of rbx into r12 
loop_start:	
	cmp BYTE PTR[r12], 0     #compares byte value of r12 to 0
	je loop_done             #jumps to loop_done if above compare statement is true
	inc rax                  #increments value of rax by 1 to hold the length of the string
	cmp BYTE PTR[r12], '`'   #compares byte value of r12 to ascii of character `
	jg comp                  #jumps to comp if greater than
	add r12, 1               #adds 1 to r12 to go to next character
	jmp loop_start           #jumps to loop_start symbol
ite:
	sub BYTE PTR[r12], 0x20  #subtracts 0x20 from byte value of r12. Making lowercase into uppercase
	add r12, 1               #adds 1 to r12 to go to next character
	jmp loop_start           #jumps to loop_start symbol

loop_done:
	add rbx, 8               #adds 8 to rbx to move to next instruction
	ret                      #return to where function was called
