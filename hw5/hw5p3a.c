/* 
 * File:   hw5p3a.c
 * Author: rob
 *
 * Created on March 19, 2014, 5:24 PM
 * this program simply takes in 2 arrays and calculates the polynomial
 *      addition of said arrays. Each cell is a degree of said polynomial
 *      
 */

#include <stdio.h>
#include <stdlib.h>

/*
 * 
 */
//function simply adds polynomials of 2 different arrays
//      T(n) = 0(n)
void addPoly(int a[], int sizeA, int b[], int sizeB){
    int i, largestSize, flag;
    //account for differing polynomial sizes
    if(sizeA >= sizeB)
        largestSize = sizeA;
    else
        largestSize = sizeB;
    int c[largestSize];
    for(i = 0; i<largestSize; i++){
        if(i>=sizeA)     //if a smaller than b just add zero to b
            c[i] = b[i]+0;
        else if(i>=sizeB)        //if b smaller....
            c[i] = a[i]+0;
        else                    //number of elements currently match
            c[i] = a[i] +b[i];
    }
    printf("Array with polynomials added...\n");
    printf("%dx^0", c[0]);
    for(i=1; i<largestSize; i++)
        printf("+ %dx^%d", c[i], i);
    printf("\n");

}

int main(void) {
    int aSize = 5; 
    int bSize = 3;
    
    int a[5]={2,4,6,8,10}, i;
    int b[3]={2,4,6};
    printf("original arrays look like...\n");
    printf("a = %d x^0",a[0]);
    for(i=1; i<aSize; i++){
        printf("+ %dx^%d ",a[i],i);
    }
    printf("\n");
    printf("b = %d x^0",b[0]);
    for(i=1; i<bSize; i++){
        printf("+ %dx^%d ",b[i],i);
    }
    printf("\n");
    addPoly(a, 5, b, 4);
    return (EXIT_SUCCESS);
}


