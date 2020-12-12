//All includes
#include <iostream>
#include <math.h>

using namespace std;

#define N 3

// Function Declaration
double dot(double a[], double b[], int n){
	int sum = 0;

	// Loop for dot product
	for(int i=0; i<n; i++){
		sum += a[i]*b[i];
	}
	return sum;
}

    // Loop for vector subtracting, according to question c1 = 1 
void vec_sub(double vec[], double a[], double c1, double b[], double c2, int n){
	for(int i=0; i<n; i++){
		vec[i] = c1*a[i] - c2 * b[i];
	}
}

// function declaration and initialization
void problem_3(double vec1[], double vec2[], double vec_a[], double vec_b[], int n){
	double scalar = 0;
	double *vec = new double[n];
	double c = 0;

	// Setting vec1 as the first input vector vec_a
	for(int i=0; i<n; i++){
		vec1[i] = vec_a[i];
	}

	// Calculation of necessary temporary variables and 'c' which makes sure |v2| = |b|
	scalar = dot(vec_a, vec_b, n) / dot(vec_a, vec_a, n);
	vec_sub(vec, vec_b, 1, vec_a, scalar, n);
	c = sqrt(dot(vec_b, vec_b, n)) / sqrt(dot(vec, vec, n)); 
	
	// Calculating final vec2
	for(int i=0; i<n ;i++){
		vec2[i] = c * vec[i];
	}
}


int main(){
	double vec_a[N] = {1, 1, 1}; // testing with an input
	double vec_b[N] = {1, -1, 1};
	double *vec1 = new double[N];
	double *vec2 = new double[N];
	problem_3(vec1, vec2, vec_a, vec_b, N);

	for (int i = 0; i < N; i++) //Loop over i
	{
		cout << vec1[i] << " ";
	}
	cout << endl;

	for (int i = 0; i < N; i++)
	{
		cout << vec2[i] << " ";
	}
	cout << endl;

	cout<<dot(vec1, vec2, N)<<endl;
	return 0;
}
