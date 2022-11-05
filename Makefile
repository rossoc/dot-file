ifeq (compile,$(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "run"
  arg= $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(RUN_ARGS):;@:)
endif

CC = g++
RC = rustc

compile:
	$(CC) $(arg) -o $(basename $(arg))

help:
	echo "Help:\n"
	cat Makefile

run:
	$(basename $(arg))

%.o: %.cpp
	$(CC) $< $(CFLAGS) -o $@

clear:
	rm *.o

test: $(basename $(arg)).in 
	cat $(basename $(arg)).in | $(basename $(arg))
