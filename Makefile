calc.o: calc.s
	as -g  calc.s -o calc.o

data/basic_cmds.o: data/basic_cmds.s
	as -g  data/basic_cmds.s -o data/basic_cmds.o

calc_basic: data/basic_cmds.o calc.o
	ld -g  calc.o data/basic_cmds.o -o calc_basic
