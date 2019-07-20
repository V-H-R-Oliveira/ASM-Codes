#include <unistd.h>
#include <sys/syscall.h>

int main()
{
  //char *args[2];
  //args[0] = "/bin/sh";
  //args[1] = NULL;
//  syscall(59, args[0], args, NULL);
	syscall(59, "/bin/sh", NULL, NULL);
  //execve(args[0], args, NULL);
  return 0;
}
