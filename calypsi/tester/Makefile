# Define OS-dependent variables

ifeq ($(OS),Windows_NT)
	RM = del /F/Q
else
	RM = rm -f
endif

CC=cc65816
AS=as65816
LD=ln65816
AR=nlib

INCLUDES=-I.
CFLAGS=$(INCLUDES) --code-model large --data-model large
ASFLAGS=$(INCLUDES) --data-model large --code-model large
LDFLAGS=f256-plain.scm clib-lc-ld.a --rtattr printf=medium --target=f256 --hosted --list-file tester.map

SRCS = tester.c test_cmds.c header.s
OBJS = $(patsubst %.s,%.o,$(patsubst %.c,%.o,$(SRCS)))
OBJS4RM = $(subst /,\\,$(OBJS))
LIBS = ../lib/toolbox.a

.PHONY: clean

tester.s37: $(OBJS) $(LIBS)
	$(LD) $(LDFLAGS) --output-format s37 -o $@ $^ 

tester.pgz: $(OBJS) $(LIBS)
	$(LD) $(LDFLAGS) --output-format pgz -o $@ $^ 

# Build the object files from C
%.o: %.c
	$(CC) $(CFLAGS) -o $@ $^

# Build the object files from assembly
%.o: %.s
	$(AS) $(ASFLAGS) -o $@ $^

# Clean up after a build
clean:
	$(RM) $(OBJS4RM) *.s37 *.o *.a *.lst *.pgz *.map
