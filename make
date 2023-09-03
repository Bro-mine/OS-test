GCCP = -m32
GASP = --32
LINKP = -melf_i386
objectfs = load.o akernel.o

%.o: %.c
	gcc $(GCCP) -o $@ -c $<

%.o: %.s
	as $(GASP) -o $@ $<

KERNEL.BIN: linker.ld $(objectfs)
	ld $(LINKP) -T $< -o $@ $(objectfs)

install: KERNEL.BIN
	sudo cp $< /boot/KERNEL.BIN
