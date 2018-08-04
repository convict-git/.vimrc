/*author: Priyanshu Shrivastav (mr.convict)
 * No copyrights associated. Readers are free to use it everywhere, any where.
 * If you find bugs, please ping me on official[dot]mr[dot]convict[at]gmail[dot]com
 * [github] (https://github.com/convict-git) */

/*TOPIC:*/
/*DISCLAIMER:*/

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>
#include <limits.h>
#include <stdarg.h>

#define sqr(x) (x)*(x)
#define mod(x) ((x)%N)
#define max(x, y) ((x)>(y) ? (x):(y))
#define min(x, y) ((x)<(y) ? (x):(y))
#define endl fprintf(stdout, "\n")
#define bug fprintf (stderr, "Here!\n")

const uint N = 1000000007; //for modular problems

void idebug (int arg_c, ...) { // can take multiple arguments
	int i;
	va_list p; //p is the pointer that moves in the argument list
	va_start (p, arg_c); //gives the start point to ptr p

	for (i = 0; i < arg_c; i++)
		fprintf(stderr, "%i ", va_arg (p, int)); //va_arg returns the int value of the int pointed by p
	va_end (p); //free up memory of p
	fprintf (stderr, "\n");
}

int main (void) {
	freopen ("in", "r", stdin);
	/*Your code goes here...*/

	return 0;
}

