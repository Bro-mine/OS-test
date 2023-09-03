gcc -m32 akernel.c -o akernel.o -c
as load.s -o load.o --32

ld -T linker.ld -o kernel.bin
