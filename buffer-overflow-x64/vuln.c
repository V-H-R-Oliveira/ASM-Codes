#include <stdio.h>
#include <string.h>

int main(int argc, char ** argv)
{
	char buffer[500];
	strcpy(buffer, argv[1]);
	printf("msg está no endereço %p e o seu conteúdo é %s\n", buffer, buffer);
   return 0;
}
