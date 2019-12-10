include ../Makefile

intcode:; mkdir -p $@
t2.fasl-run: intcode
	chmod +x t2.fasl
	seq -w 0 9999 | xargs -I{} -P 2500 -n1 bash -c \
		'./t2.fasl {} < input > $</{}'
