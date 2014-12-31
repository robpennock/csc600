/*
#include <stdio.h>
#include <stdlib.h>

void printArray(int * anArray, int n){
    int i=(int)0;
    printf("array looks like: \n");
	for(i=0; i<n; i++)
		printf("a[%d] = %d; ", i, anArray[i]);
    printf("\n");
}

int maxlen(int * anArray, int n){
	int cur_count = 1;		//length of current "series" of integers
	int prev_num = anArray[0];	//setting first number to smallest
	int cur_num = prev_num; 	//cur == prev for now
	int max_count=1;		//length of longest run of integers
	int i;				//used for counter
	
	// algorithm is O(n) since only one run thru array via single for loop
	for(i=1 ; i<n ; i++){
            
		cur_num = anArray[i];                   //increment cur_num    
                prev_num = anArray[i-1];		//increment prev_num
		//printf("\nbegin walkthru %d\n", i);
		//printf("i = %d; cur_num = %d; prev_num = %d; cur_count = %d, max_count = %d\n", i, 
		//		cur_num, prev_num, cur_count, max_count);
		if(cur_num > prev_num)  	//if cur num is greater than prev_num then new series
		   cur_count=1;						//must increment counter
		if(cur_num == prev_num)
                        cur_count++;    //increment cur_count if anothe int in "series"
	        if(cur_count > max_count)
                        max_count=cur_count;
	}

	return max_count;
}*/
/*
int main(void){
        //no unnecessary conversions. All constants are integers
	int array_1[13] = {1,1,1,2,3,3,5,6,6,6,6,7,9};    
        int array_2[16] = {1,1,1,1,1,1,2,3,3,5,6,6,6,6,7,9};
	int result;
	result = maxlen(array_1, 13 );
	printf("The longest sequence in array_1 is: %d\n", result);
        result = maxlen(array_2, 16 );
	printf("The longest sequence in array_2 is: %d\n", result);

	return 0;	
}*/