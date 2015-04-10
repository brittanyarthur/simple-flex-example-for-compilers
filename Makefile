DEPS=example.o lex.o

example: $(DEPS)
	gcc $(DEPS) -o example

all: example

# Flex
lex.o: lex.c
	gcc -w lex.c -c -o lex.o

lex.c: lex.l
	flex -o lex.c lex.l

clean:
	rm -rf example *.o lex.c

