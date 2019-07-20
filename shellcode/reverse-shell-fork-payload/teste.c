#include <unistd.h>
#include <sys/syscall.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <arpa/inet.h>

void main(void)
{
	int fd = syscall(41, AF_INET, SOCK_STREAM, 6);
	struct sockaddr_in servaddr;

	servaddr.sin_family = AF_INET;
	servaddr.sin_addr.s_addr = inet_addr("127.0.0.1");
	servaddr.sin_port = htons(8080);

	syscall(42,fd,(struct sockaddr *)&servaddr, sizeof(servaddr));
}
