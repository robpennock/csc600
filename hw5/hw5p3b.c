/* 
 * File:   hw5p3c.c
 * Author: rob
 *
 * Created on March 19, 2014, 5:24 PM
 * this program simply takes in 2 arrays and calculates the multiplication of
 *      polynomials based on each cell as a coefficient
 */

#include <stdio.h>
#include <stdlib.h>

/*
 * 
 */

void multPoly(int a[], int sizeA, int b[], int sizeB){
    int i, j, sizeC;
    sizeC= sizeA;
    int c[sizeC];
    memset(c, 0, sizeof(c));    //set all array elements to zero
    if (sizeA != sizeB){
        fprintf(stderr, "Error: polynomials of different degrees\n");
        exit(-1);
    }
    //populate new array
    for(i=0, j=0; i<sizeA; i++ ){
        //must use += to account for multiple coefs for same cell 
        c[i+j] += a[i]*b[j];  
    }
    //print derivative
    printf("New multiplied polynomial looks like...\n");
    printf("c = %dx^0 ",c[0]);
    for(i = 1, j=1; i<sizeC; i++, j++)
    {
        printf("+ %dx^%d ",c[i],i+j);
    }
    printf("\n");
}

int main(void) {
    int a[3]={2,1,-2}, i;
    int b[3]={3,2,3};
    int sizeA=sizeof(a)/4;      //size of used to make things easier to test
    int sizeB=sizeof(b)/4;      //must divide by 4 since 
    printf("array before derivative function...\n");
    printf("a = %dx^0",a[0]);
    for(i = 1; i<sizeA; i++)
        printf("+ %dx^%d",a[i], i);
    printf("\n");
    printf("b = %dx^0",b[0]);
    for(i = 1; i<sizeB; i++)
        printf("+ %dx^%d",b[i], i);
    printf("\n");
    multPoly(a, 3, b, 3);
    return (EXIT_SUCCESS);
}

