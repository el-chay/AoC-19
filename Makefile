# AoC 2019 day 1
# make : .lisp to .fasl
# make run : executes all programs with time
all: $(patsubst %.lisp,%.fasl,$(wildcard *.lisp))

%.fasl: SHELL = /usr/bin/sbcl
%.fasl: .SHELLFLAGS = --noinform --no-sysinit --no-userinit --quit --eval
%.fasl: %.lisp
	(compile-file "$<")

run: $(patsubst %.fasl,%.fasl-run,$(wildcard *.fasl))
%-run:
	time -p /usr/bin/sbcl --noinform --script $* < $(patsubst %.fasl,%.input,$*)

clean:
	rm -f *.fasl
