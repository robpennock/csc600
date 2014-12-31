/* 
 * File:   hw5p3c.c
 * Author: rob
 *
 * Created on March 19, 2014, 5:24 PM
 * this program simply takes in an array and calculates the derivative
 *      based on the number of cells.
 */

#include <stdio.h>
#include <stdlib.h>

/*
 * 
 */

void derivative(int a[], int size){
    int i, cur, next, prev;
    for(i=1; i<size; i++){
        //start at second element since derivative of C is 0
        a[i] = a[i]*i;  // derivative is coef * i
        a[i-1] = a[i];	//shift
    }
    a[size-1] = 0;
    //print derivative
    printf("Derivative looks like...\n");
    printf("a' = %dx^1 ",a[0]);
    for(i = 1; i<size; i++)
    {
        printf("+ %dx^%d ",a[i],i+1 );
    }
}

int main(void) {
    int a[5]={2,2,2,2,2}, i;
    printf("array before derivative function...\n");
    printf("a = %dx^0",a[0]);
    for(i = 1; i<5; i++)
        printf("+ %dx^%d",a[i], i);
    printf("\n");
    derivative(a, 5);
    return (EXIT_SUCCESS);
}

