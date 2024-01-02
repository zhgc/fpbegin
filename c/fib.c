#include <stdio.h>
#include <stdlib.h>

typedef unsigned long long ull;

ull fibloop(int,ull,ull);
ull fib(int);
int inputNum();
int leave();

ull fibloop(int n,ull a,ull b){
    return n == 0
        ? a
        : n == 1
        ? b
        : fibloop(n-1,b,a+b);
}

ull fib(int n){
    return n < 0 
        ? fprintf(stderr,"Invalid input"),leave()
        : fibloop(n,0,1);
}

int inputNum(){
    char * b = malloc(80 * sizeof(char));
    int a = atoi(fgets(b,80,stdin));
    free(b);
    return a;
}

int leave(){
    exit(0);
}

int main(){
    printf("%llu",fib(inputNum()));
}