#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <unistd.h>

int main()
{
	int pdf[ 2 ];
	pipe( pdf );

	int output = 0;

	if (fork() == 0)
	{
		close( 1 );
		dup( pdf[ 1 ] );
		close( pdf[ 1 ] );
		close( pdf[ 0 ] );

		if (execlp( "ls", "ls", NULL ) == -1)
		{
			printf("execlp 1 error");
			return -1;
		}
	}

	close( pdf[ 1 ] );

#define MAX 10
	char buf[ MAX ];

	int chars = read( pdf[ 0 ], buf, MAX );
	
	while (chars > 0)
	{
		output += chars;

		chars = read( pdf[ 0 ], buf, MAX );
 	}

 	printf("%d\n", output);

}