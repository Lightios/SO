#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <fcntl.h>

int main()
{

	if (fork() == 0)
	{
		printf("PPID: %d \n", getppid());
		sleep(5);
		printf("PPID: %d \n", getppid());
		exit(0);
	}

	sleep(1);
	printf( "Print od rodzica \n" );

	// zombie
	

	if (fork() == 0)
	{
		exit(0);
	}

	sleep(1);
	execlp("ps", "ps", "-l", NULL);
}
