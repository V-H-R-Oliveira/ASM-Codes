all:
	nasm -f elf64 convert-all.asm && ld -o convert-all convert-all.o
production:
	nasm -f elf64 convert-all.asm && ld -s -o convert-all convert-all.o
clean:
	rm convert-all convert-all.o
