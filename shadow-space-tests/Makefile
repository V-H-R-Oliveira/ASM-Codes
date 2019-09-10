all:
	nasm -f elf64 shadow-space-example.asm && ld -s -o shadow-space-example shadow-space-example.o && rm shadow-space-example.o && nasm -f elf64 simple-xor-shadow-space.asm && ld -s -o simple-xor-shadow-space simple-xor-shadow-space.o && rm simple-xor-shadow-space.o
example:
	nasm -f elf64 shadow-space-example.asm && ld -s -o shadow-space-example shadow-space-example.o && rm shadow-space-example.o
clean-example:
	rm shadow-space-example
clean:
	rm shadow-space-example simple-xor-shadow-space
xor:
	nasm -f elf64 simple-xor-shadow-space.asm && ld -s -o simple-xor-shadow-space simple-xor-shadow-space.o && rm simple-xor-shadow-space.o
clean-xor:
	rm simple-xor-shadow-space
