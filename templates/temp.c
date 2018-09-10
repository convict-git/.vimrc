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

#define SQR(x) (x)*(x)
#define MOD(x) ((x)%N)
#define max(x, y) ((x)>(y) ? (x):(y))
#define min(x, y) ((x)<(y) ? (x):(y))
#define inf 0x7fffffff
#define endl fprintf(stdout, "\n")
#define bug fprintf (stderr, "Here!\n")

const uint N = 1000000007; //for modular problems
void idebug (int, ...);
void merge (int*, int, int*, int);
void merge_sort (int*, int);
void swap (int*, int*);


int main (void) {
	freopen ("in", "r", stdin);
	/*Your code goes here...*/
	int n;
	scanf (" %i", &n);
	int A[n];
	for (int i = 0; i < n; ++i)
	  scanf (" %i", A + i);

	merge_sort (A, n);
	for (int i = 0; i < n; ++i)
	  printf ("%i ", A[i]);
	endl;

	return 0;
}

/* * * * * utility functions * * * * */
void idebug (int arg_c, ...) {
	int i;
	va_list p;
	va_start (p, arg_c);

	for (i = 0; i < arg_c; i++)
		fprintf(stderr, "%i ", va_arg (p, int));
	va_end (p);
	fprintf (stderr, "\n");
}

void merge (int* a, int a_n, int *b, int b_n) {
  int L[a_n + 1], R[b_n + 1];
  L[a_n] = R[b_n] = inf;
  for (int i = 0; i < a_n; ++i)
	 L[i] = *(a + i);
  for (int i = 0; i < b_n; ++i)
	 R[i] = *(b + i);

  for (int i = 0, j = 0, k = 0 ; i < a_n + b_n; ++i)
  {
	 if (i < a_n) a[i] = L[j] < R[k] ? L[j++] : R[k++];
	 else b[i - a_n] = L[j] < R[k] ? L[j++] : R[k++];
  }
}

void merge_sort (int* A, int n) {
	if (n == 1 || n == 0)
		 return;
	merge_sort (A, n/2);
	merge_sort (A+n/2, n-n/2);
	merge (A, n/2, A+n/2, n-n/2);
}

void swap (int* a, int *b) {
	 int temp = *a;
	 *a = *b;
	 *b = temp;
	 return;
}
