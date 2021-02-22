#include <stdio.h>
#include <sys/time.h>

int
main(void)
{
	struct timeval start;
	struct timeval stop;
	float acc = 0.0;

	gettimeofday(&start, NULL);
	for(int i = 0; i < 2048; ++i)
		acc += 0.1;
	gettimeofday(&stop, NULL);
	printf("Time in microseconds: %lu\n", stop.tv_usec - start.tv_usec);
	return 0;
}
