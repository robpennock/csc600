/* 
 * File:   hw5p3c.c
 * Author: rob
 *
 * Created on March 19, 2014, 5:24 PM
 * this program simply takes in an array and calculates the integral
 *      based on the number of cells. Each cell cooresponds to the degree
 *      of a polynomial
 */

#include <stdio.h>
#include <stdlib.h>

/*
 * 
 */

void integral(int a[], int size){
    int i;
    for(i=0; i<size; i++){
        //new coef is current coef divided by degree of next i
        a[i] = a[i]/(i+1);  
    }
    //print integral
    printf("integral is...\n");
    for(i = 0; i<size; i++)
    {
        printf("%d x^%d + ",a[i],i+1 );
        if(i==(size-1))
            printf("C\n");
    }
}

int main(void) {
    int a[5]={2,4,6,8,10}, i;
    printf("original array is...\n");
    printf("%d x^0",a[0]);
    for(i=1; i<5; i++){
        printf("+ %dx^%d ",a[i],i);
    }
    printf("\n");
    integral(a, 5);
    return (EXIT_SUCCESS);
}


