#include <stdio.h>
#include <limits.h>
#include <stdlib.h>

int * reduce(int * anArray, int n){
	int small, middle, large = INT_MIN;
	int i, cur;
	int sm_count, mid_count, lg_count = 0;
	if(n<=3){
		fprintf(stderr, "ERROR: array must be more than 3 cells in length\n");
		exit -1;
	}
	large = anArray[0];
	for(i=0 ; i<n ; i++ ){
		cur =anArray[0];
		if(cur > large) {
			small = middle;
			middle = large;
			large=cur;
			sm_count = mid_count;
			mid_count = lg_count;
			lg_count = 1;
		}

	}
	return anArray;
}

int main (void){
	int smallest = INT_MIN;
	printf("%d", smallest);
	return 0;	
}
