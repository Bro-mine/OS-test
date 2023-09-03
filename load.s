.set MAGIC, 0x1BADB002 # multiboot compliance
.set FLAGS, (1<<0 | 1 << 1)
.set CHECKSUM, -(MAGIC + FLAGS)

.section .multiboot
	.long MAGIC
	.long FLAGS
	.long CHECKSUM
	

.section .text
.extern akernelMain
.global load

load:
	mov $akernel_stack, %esp # set stack pointer
	call akernelMain

# an infinite loop. Is the one on akernel.c not enough?
# I suppose you could remove this, but that's a hypothesis
_stop:
	cli
	hlt
	jmp _stop


.section .bss
.space 2*1024*1024 # buffer space for the stack pointer, avoiding overwrites
akernel_stack:
