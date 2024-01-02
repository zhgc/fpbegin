#include <stdio.h>
#include <stdlib.h>

typedef unsigned long long ull;

ull fibloop(int n,ull a,ull b){
    return n == 0
        ? a
        : n == 1
        ? b
        : fibloop(n-1,b,a+b);
}

int leave(){
    exit(0);
}

ull fib(int n){
    return n < 0
        ? fprintf(stderr,"Invalid Input"),leave()
        : fibloop(n,0,1);
}

int inputNum(){
    char * b = malloc(80 * sizeof(char));
    int a = atoi(fgets(b,80,stdin));
    free(b);
    return a;
}

int main (){
    printf("%llu",fib(inputNum()));
}