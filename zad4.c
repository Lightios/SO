#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <ctype.h>

#define MAX 512

int main(int argc, char* argv[])
{
	int desc;
	char buf[MAX];
	int output = 1;
	int lbajt;

	if (argc < 2)
	{
		fprintf(stderr, "Za malo argumentow. Uzyj:\n");
		fprintf(stderr, "%s <nazwa pliku>\n", argv[0]);
		exit(1);
	}

	desc = open(argv[1], O_RDONLY);
	if (desc == -1)
	{
		perror("Blad otwarcia pliku");
		exit(1);
	} 

	while((lbajt = read(desc, buf, MAX)) > 0)
	{
		for (int i = 0; i < lbajt; i++)
		{
			if (!isascii(buf[i]))
				output = 0;
		}
 	} 

	printf("Odpowiedz: %d \n", output);

	if (close(desc) == -1)
	{
		perror("Blad zamkniecia pliku");
		exit(1);
	}

	exit(0);
} 