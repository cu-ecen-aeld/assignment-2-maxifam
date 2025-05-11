#selecting the compiler, native or ARM
CC := $(if $(CROSS_COMPILE), $(CROSS_COMPILE)gcc, gcc)

#default rule
all: writer

#linking .o files
writer: writer.o
	$(CC) writer.o -o writer

#compile writer.c
writer.o : writer.c
	$(CC) -c writer.c -o writer.o

.PHONY: clean all
clean:
	rm -f writer.o writer
