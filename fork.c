#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <fcntl.h>

int main()
{

	if (fork() == 0)
	{
		int file;
		
    	file = open( "dziecko.txt", O_WRONLY );
		close(1);
		dup(file);
		execlp( "ls", "ls", "-l", NULL );
	}

	printf( "Print od rodzica" );
}
