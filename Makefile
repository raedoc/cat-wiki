all: clean
	gcc server.c -o server

test: all
	./test.sh

clean:
	rm -f server