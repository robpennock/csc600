#include <stdio.h>
#include <stdlib.h>

void derivative(int a[], int size){
	int i;
	for(i=1; i<size-1; i++){
		a[i] = a[i]*i;
		a[i] = a[i+1];	//shift
	}
	a[size-1] = 0;
	for(i = 0; i<size; i++)
	{
		printf()
	}
}
