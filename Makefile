or.o: or.s
	as -g or.s -o or.o

and.o: and.s
	as -g and.s -o and.o

sum.o: sum.s
	as -g sum.s -o sum.o

calc.o: calc.s
	as -g  calc.s -o calc.o

data/basic_cmds.o: data/basic_cmds.s
	as -g  data/basic_cmds.s -o data/basic_cmds.o

data/simpleone_cmds.o: data/simpleone_cmds.s
	as -g  data/simpleone_cmds.s -o data/simpleone_cmds.o

calc_basic: data/basic_cmds.o calc.o and.o or.o sum.o
	ld -g  calc.o and.o or.o sum.o data/basic_cmds.o -o calc_basic

calc_simpleone: data/simpleone_cmds.o calc.o and.o or.o sum.o
	ld -g  calc.o and.o or.o sum.o data/simpleone_cmds.o -o calc_simpleone
