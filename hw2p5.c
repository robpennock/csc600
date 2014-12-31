#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <limits.h>

#define MAX_INT 32767;

int itBinSearch(int array[], int n, int x){	//where n is array size and x is search key
	/*original algorithm courtesy of CSC340*/	
	int first, mid, last;
	first= 0 ; last= n-1 ;
	while (first<= last){
		mid = (first + last) / 2 ;				//divide and conquer
		if (x < array[mid]) last= mid-1 ; 		//search first half
		else if (x > array[mid]) first= last+1 ;	//search second half
		else return mid ;
	}
	return -1 ; // if there is no match
}

int recBinSearch(int array[], int first, int last, int x){
	int mid = (first + last) / 2;
	if(first > last) 
		return -1; // no match
	if(x < array[mid]) 
		return recBinSearch(array, first, mid-1, x);	//search first half
	if(x > array[mid]) 
		return recBinSearch(array, mid+1, last, x);	// search second half
	return mid;
}

void arrayPop(int anArray[], int n){
	int i;
	for(i=0;i<n; i++)
		anArray[i]=i;
}
int main (void){
	int  j, n, k, i, first;
	time_t time1, time2, time3, time4;
	n = MAX_INT;
	int myArray[n];
	arrayPop(myArray, n);
	k=1000;
	first=0;

	printf("Beginning Recursive Binary Search\n");
	time(&time1);
	for(j=0;j<k;j++){
		for(i=0; i<n; i++){
			if(recBinSearch(myArray, first, n, i) != i)
				fprintf(stderr, "\nError: list item '%d' not found \n", i);
		}
	}
	time(&time2);
	printf("%f\n", difftime(time2, time1));
	printf("Now beginning Iterative Binary Search\n");
	time(&time3);

    for(j=0;j<k;j++){
        for(i=0; i<n; i++){
            if(itBinSearch(myArray, n, i) != i)
                fprintf(stderr, "\nError: list item '%d' not found \n", i); 
        }   
    }//itBinSearch still messed up
	time(&time4);
	printf("%f\n", difftime(time4, time3));
	return 0;
}
