echo -n "Digite o nome do arquivo, sem nenhuma extensão: "
read file

$(nasm -f elf64 $file.asm && ld -s -o execc $file.o && for i in `objdump -d execc | tr '\t' ' ' | tr ' ' '\n' | egrep '^[0-9a-f]{2}$' ` ; do echo -n "\x$i" ; done > shellcode.txt && rm $file.o execc)

echo "Shellcode se encontra no arquivo shellcode.txt!!!"
