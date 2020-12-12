#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>


void initialize(double *a, int n, double val){
    for(int i=0; i<n; i++)
        for(int j=0; j<n; j++)
            a[i*n+j] = val;
}


void eye(double *a, int n) {
    for(int i=0; i<n; i++)
        a[i*n+i] = 1.0;
    
}


double absmean(double *a, int n){
    double sum = 0;

    for(int i=0; i<n; i++)
        for(int j=0; j<n; j++)
            sum += fabs(a[i*n+j]);

    sum = sum/((double)n*(double)n);
    return sum;
}


void add(double *c, double *a, double *b, double k1, double k2, int n){
    for(int i=0; i<n; i++)
        for(int j=0; j<n; j++)
            c[i*n+j] = k1*a[i*n+j] + k2*b[i*n+j];
}


void matmul(double *c, double *a, double *b, int n){
    for(int l=0; l<n; l++)
        for(int m=0; m<n; m++){
            c[l*n+m]=0.0;
            for(int i=0; i<n; i++)
                    c[l*n+m] += a[l*n+i] * b[i*n+m];
        }    
}


void copy(double *a, double *b, int n){
    for(int i=0; i<n; i++)
        for(int j=0; j<n; j++)
            a[i*n+j] = b[i*n+j];
}


void printArray(double *a, int n){
    for(int i=0; i<n; i++){
        for(int j=0; j<n; j++){
            printf("%f  ", a[i*n+j]);
        }
        printf("\n");
    }
    printf("\n");
}



void calculate_log(int n){
    double eps = 2.22e-16;
    int k=1;
    double a[n*n];
    double ones[n*n];
    double loga[n*n];
    double basemat[n*n];
    double ident[n*n];
    double temp1[n*n];
    double temp2[n*n];
    double temp3[n*n];

    initialize(a, n, 0.0);
    initialize(loga, n, 0.0);
    initialize(basemat, n, 0.0);

    initialize(ident, n, 0.0);
    eye(ident, n);

    initialize(ones, n, 1.0);

    // create matrix A 
    add(a, ident, ones, (double)1/(n+1), (double)1/(n+1), n); 

    // create I-A
    initialize(basemat, n, 0.0);
    add(basemat, ident, a, 1.0, -1.0, n);

    while((absmean(basemat, n)/((double)k))>eps){
        // calculate I-A
        initialize(temp1, n, 0.0);
        add(temp1, ident, a, 1.0, -1.0, n);

        // calculate logA = -logA_1-(I-A)*(I-A)*...*(I-A)
        initialize(temp3, n, 0.0);
        add(temp3, loga, basemat, 1.0, -1.0/((double)k), n);
        copy(loga, temp3, n);

        // calculate (I-A)*(I-A)*...*(I-A)
        initialize(temp2, n, 0.0);
        matmul(temp2, basemat, temp1, n);
        copy(basemat, temp2, n);

        k++;
        if(k>40000){
            break;
        }

    }
    // printArray(loga, n);
}


int main(void){
    int n[]={10, 20, 50, 100, 200, 500, 1000, 2000};
    clock_t begin;
    clock_t end;


    for(int i=0; i<1; i++){
        printf("n=%d,  ", n[i]);
        begin = clock();
        calculate_log(10); // Calculation for n = 10
        end = clock();
        printf("Elapsed time: %lfsec\n", (double)(end-begin)/CLOCKS_PER_SEC);
    }
    return 0;
}
