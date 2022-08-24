#include <stdio.h>
#include <math.h>


float square_root(int x){
    int r = 0;
    int s = 1;

    while(s<=x){
        s = s + 2*(r+1) + 1;
        r = r+1;
    }
    return r;
}

int main(){
    
    int x;
    scanf("%d",&x);
    float root = square_root(x);
    printf("raiz cuadrada: %f",root);
    return 0;
}