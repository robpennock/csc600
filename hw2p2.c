#include <stdio.h>
#include <stdlib.h>
double determinate(double ** detArray){
	double a = (double)detArray[0][0];
	double b = (double)detArray[0][1];
	double c = (double)detArray[0][2];
	double deta, detb, detac;

	deta = a * ((detArray[1][1] * detArray[2][2]) - (detArray[2][1] * detArray[1][2]));

	detb = -(b * ((detArray[1][0] * detArray[2][2]) - (detArray[2][0] * detArray[1][2]))); 

	deta = c * ((detArray[1][0] * detArray[2][1]) - (detArray[2][0] * detArray[1][1]));

	return (a + b + c);
}

int main(void){

	return 0;
}
