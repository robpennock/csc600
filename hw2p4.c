#include <stdio.h>
#include<math.h>
#include <string.h>

char one[7][7] = {{' ',' ','@','@',' ',' ',' '},
                          {' ','@','@','@',' ',' ',' '},
                          {' ',' ','@','@',' ',' ',' '},
                          {' ',' ','@','@',' ',' ',' '},
                          {' ',' ','@','@',' ',' ',' '},
                          {' ',' ','@','@',' ',' ',' '},
                          {' ','@','@','@','@',' ',' '}};

char two[7][7] = {{' ','@','@','@','@',' ',' '},
                  {' ','@',' ',' ','@',' ',' '},
                  {' ',' ',' ',' ','@',' ',' '},
		  {' ','@','@','@','@',' ',' '},
		  {' ','@',' ',' ',' ',' ',' '},
                          {' ','@',' ',' ','@',' ',' '},
                          {' ','@','@','@','@',' ',' '}};

        char three[7][7] = {{' ','@','@','@','@',' ',' '},
                            {' ',' ',' ',' ','@',' ',' '},
                            {' ',' ',' ',' ','@',' ',' '},
                            {' ','@','@','@','@',' ',' '},
                            {' ',' ',' ',' ','@',' ',' '},
                            {' ',' ',' ',' ','@',' ',' '},
                            {' ','@','@','@','@',' ',' '}};

        char four[7][7] = {{' ','@',' ',' ','@',' ',' '},
                           {' ','@',' ',' ','@',' ',' '},
                           {' ','@',' ',' ','@',' ',' '},
                           {' ','@','@','@','@',' ',' '},
                           {' ',' ',' ',' ','@',' ',' '},
                           {' ',' ',' ',' ','@',' ',' '},
                           {' ',' ',' ',' ','@',' ',' '}};
char five[7][7] = {{' ','@','@','@','@',' ',' '},
                           {' ','@',' ',' ',' ',' ',' '},
                           {' ','@',' ',' ',' ',' ',' '},
                           {' ','@','@','@','@',' ',' '},
                           {' ',' ',' ',' ','@',' ',' '},
                           {' ',' ',' ',' ','@',' ',' '},
                           {' ','@','@','@','@',' ',' '}};

        char six[7][7] = {{' ','@','@','@','@',' ',' '},
                          {' ','@',' ',' ',' ',' ',' '},
                          {' ','@',' ',' ',' ',' ',' '},
                          {' ','@','@','@','@',' ',' '},
                          {' ','@',' ',' ','@',' ',' '},
                          {' ','@',' ',' ','@',' ',' '},
                          {' ','@','@','@','@',' ',' '}};

        char seven[7][7] = {{' ','@','@','@','@',' ',' '},
                            {' ','@',' ',' ','@',' ',' '},
                            {' ',' ',' ',' ','@',' ',' '},
                            {' ',' ',' ','@',' ',' ',' '},
                            {' ',' ',' ','@',' ',' ',' '},
                            {' ',' ',' ','@',' ',' ',' '},
                            {' ',' ',' ','@',' ',' ',' '}};

        char eight[7][7] = {{' ','@','@','@','@','@',' '},
                            {' ','@',' ',' ',' ','@',' '},
                            {' ','@',' ',' ',' ','@',' '},
                            {' ',' ','@','@','@',' ',' '},
                            {' ','@',' ',' ',' ','@',' '},
                            {' ','@',' ',' ',' ','@',' '},
                            {' ','@','@','@','@','@',' '}};

        char nine[7][7] = {{' ','@','@','@','@',' ',' '},
                           {' ','@',' ',' ','@',' ',' '},
                           {' ','@',' ',' ','@',' ',' '},
                           {' ','@','@','@','@',' ',' '},
                           {' ',' ',' ',' ','@',' ',' '},
                           {' ',' ',' ',' ','@',' ',' '},
                           {' ','@','@','@','@',' ',' '}};

char zero[7][7] = {{' ','@','@','@','@',' ',' '},
                           {' ','@',' ',' ','@',' ',' '},
                           {' ','@',' ',' ','@',' ',' '},
                           {' ','@',' ',' ','@',' ',' '},
                           {' ','@',' ',' ','@',' ',' '},
                           {' ','@',' ',' ','@',' ',' '},
                           {' ','@','@','@','@',' ',' '}};
void bigInt(char charArray[], int n){
	int i;
	int j=0;




	for(i = 0; i<7; i++){
		for(j=0; j<7; j++){
			printf("%c",  nine[i][j] );
		}
		printf("\n");
	}
	printf("\n");
	for(i = 0; i<7; i++){
                for(j=0; j<7; j++){
                        printf("%c",  zero[i][j] );
                }
                printf("\n");
        }
	printf("\n");
}

int main (void){
	bigInt();
	return 0;
}
