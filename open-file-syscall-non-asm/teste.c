#include <sys/types.h>
#include <sys/stat.h>
#include <sys/fcntl.h>
#include <sys/syscall.h>
#include <string.h>

int main(void)
{
    const char *path = "/home/bigdick/Área de Trabalho/Assembly-codes/open-file/ola.txt";
    int fd;
    char *buf[100];

    fd = open(path, O_RDWR|O_CREAT|O_APPEND, S_IRWXU|S_IRWXG|S_IRWXO);
    
    if(fd != -1)
    {
        read(fd, buf, 100);
        write(1, buf, strlen(buf));
        close(fd);
    }

    return 0;
}
