or.o: or.s
	as -g or.s -o or.o

and.o: and.s
	as -g and.s -o and.o

sum.o: sum.s
	as -g sum.s -o sum.o

upper.o: upper.s
	as -g upper.s -o upper.o

calc.o: calc.s
	as -g  calc.s -o calc.o

data/basic_cmds.o: data/basic_cmds.s
	as -g  data/basic_cmds.s -o data/basic_cmds.o

data/simpleone_cmds.o: data/simpleone_cmds.s
	as -g  data/simpleone_cmds.s -o data/simpleone_cmds.o

data/upperonly_cmds.o: data/upperonly_cmds.s
	as -g data/upperonly_cmds.s -o data/upperonly_cmds.o

data/easy_cmds.o: data/easy_cmds.s
	as -g data/easy_cmds.s -o data/easy_cmds.o

data/basicwithupper_cmds.o: data/basicwithupper_cmds.s
	as -g data/basicwithupper_cmds.s -o data/basicwithupper_cmds.o

data/simplerandom_cmds.o: data/simplerandom_cmds.s
	as -g data/simplerandom_cmds.s -o data/simplerandom_cmds.o

calc_simplerandom: data/simplerandom_cmds.o calc.o and.o or.o sum.o upper.o
	ld -g  calc.o and.o or.o sum.o data/simplerandom_cmds.o -o calc_simplerandom

calc_basicwithupper: data/basicwithupper_cmds.o calc.o and.o or.o sum.o upper.o
	ld -g  calc.o and.o or.o sum.o data/basicwithupper_cmds.o -o calc_basicwithupper

calc_easy: data/easy_cmds.o calc.o and.o or.o sum.o upper.o
	ld -g  calc.o and.o or.o sum.o data/easy_cmds.o -o calc_easy

calc_upperonly: data/upperonly_cmds.o calc.o and.o or.o sum.o upper.o
	ld -g  calc.o and.o or.o sum.o upper.o data/upperonly_cmds.o -o calc_upperonly

calc_basic: data/basic_cmds.o calc.o and.o or.o sum.o
	ld -g  calc.o and.o or.o sum.o data/basic_cmds.o -o calc_basic

calc_simpleone: data/simpleone_cmds.o calc.o and.o or.o sum.o
	ld -g  calc.o and.o or.o sum.o data/simpleone_cmds.o -o calc_simpleone
