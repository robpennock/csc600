//hw02-02
#include <iostream>
#include <iomanip>

using namespace std;

double y(double x1, double x2, double x3, double y1, double y2, double y3,
         double x){
    double denominator = (x1-x2)*(x2-x3)*(x1-x3);
    double a = (x3*(y2-y1)+x2*(y1-y3)+ x1*(y3-y2))/denominator;
    double b = (x3*x3*(y1-y2)+x2*x2*(y3-y1)+x1*x1*(y2-y3))/denominator;
    double c = (x2*x3*(x2-x3)*y1+ x3*x1*(x3-x1)*y2+ x1*x2*(x1-x2)*y3)
    /denominator;
    
    return (a*(x*x)+b*x +c); 
    

}
int main(){
    double x1, x2, x3, y1, y2, y3, x;
    cout << "input x1 y1 x2 y2 x3 y3   " << endl;
    cin >> x1 >> y1 >> x2 >> y2 >> x3 >> y3;
    
    x = x1;
    int i, n=40;
    double gap = (x3-x1)/(double)n;
    
    for(i=0; i <n ; i++){
       cout <<"x: " << setw(10) << x << "   y: " <<setw(10) 
       <<y(x1,x2,x3,y1,y2,y3,x) << endl;
       x+=gap;
    }
     
    
    
 //windows only   
//     system("pause");
    return 0;   
}
