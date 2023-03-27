	.intel_syntax noprefix
	.section .text   #the start of where the code begins
	.global _start   #makes the _start symbol accessible to all other files
U:
	add rbx, 8       #adding 8 to rbx to move to the command argument
	call UPPER_FRAG  #calling UPPER_FRAG symbol from upper.s
	ret              #returning back to where UPPER_FRAG was called
A:
	add rbx, 8       #adding 8 to rbx to move to command argument
	call AND_FRAG    #calling AND_FRAG symbol from and.s
	ret              #returning back to where AND_FRAG was called
O:
	add rbx, 8       #adding 8 to rbx to move to command argument
	call OR_FRAG     #calling OR_FRAG symbol from or.s
	ret              #returning back to where OR_FRAG was called
S:
	add rbx, 8       #adding 8 to rbx to move to command argument
	call SUM_FRAG    #calling SUM_FRAG symbol from sum.s
	ret              #returning back to where SUM_FRAG was called
comp:
	cmp QWORD PTR[rbx], '|'   #compare the value of rbx to the '|' symbol 
	je O                      #jump to O dummy function if rbx is equal to the symbol
	cmp QWORD PTR[rbx], '&'   #compare the value of rbx to the '&' symbol
	je A                      #jump to A dummy function if rbx is equal to the symbol
	cmp QWORD PTR[rbx], 'S'   #compare the value of rbx to the 'S' symbol
	je S                      #jump to S dummy function if rbx is equal to the symbol
	cmp QWORD PTR[rbx], 'U'   #compare the value of rbx to the 'U' symbol
	je U                      #jump to U dummy function if rbx is equal to the symbol
	
_start:
	xor rax, rax                       #setting rax to 0
	mov rbx, OFFSET [CALC_DATA_BEGIN]  #moves the memory address of CALC_DATA_BEGIN into rbx
loop_start:	
	cmp QWORD PTR[rbx], 0   #compares the value of rbx to 0
	jz loop_done            #jumps to loop_done if rbx is equal to 0
	call comp               #calls comp symbol
	jmp loop_start          #jumps to loop_start
loop_done:
	mov QWORD PTR[pointer], rax        #moves rax into pointer
	mov rax, 1                         #system call number for write
	mov rdi, 1                         #file descriptor for stdout
	mov rsi, OFFSET[pointer]           #data we want to write to stdout, memory addres of pointer
	mov rdx, 8                         #size of data
	syscall                            #call to write syscall

	mov rax, 1                         #system call number for write
	mov rdi, 1                         #file descirptor for stdout
	mov rsi, OFFSET[SUM_POSITIVE]      #data we want to write to stdout, memory address of SUM_POSITIVE
	mov rdx, 8                         #size of data
	syscall                            #call to write syscall

	mov rax, 1                         #system call number for write
	mov rdi, 1                         #file descriptor for stdout
	mov rsi, OFFSET[SUM_NEGATIVE]      #data we want to write to stdout, memory address of SUM_NEGATIVE
	mov rdx, 8                         #size of data
	syscall                            #call to write syscall

	mov rax, 1			   #system call number for write
	mov rdi, 1			   #file descriptor for stdout
	mov rcx, OFFSET [CALC_DATA_BEGIN]  #moves memory address of CALC_DATA_BEGIN to rcx
	mov rdx, OFFSET [CALC_DATA_END]    #moves memory address of CALC_DATA_END to rdx
	mov rsi, OFFSET [CALC_DATA_BEGIN]  #moves memory address of CALC_DATA_BEGIN to rsi, because we want to start the write call at CALC_DATA_BEGIN address
	sub rdx, rcx                       #subtracts rcx from rdx to get the correct size of the data we want to write to stdout
	syscall                            #call to write syscall

	mov rax, 60                        #moves 60 into rax 
	xor rdi, rdi                       #sets rdi to 0
	syscall                            #call to syscall
	
	.section .data                     #data section of the file

pointer:
	.quad 0                            #allocated 8 bytes of 0 to a placeholder pointer
