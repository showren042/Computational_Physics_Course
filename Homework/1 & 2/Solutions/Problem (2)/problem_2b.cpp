#include <iostream>
#include <math.h>
#include <cstdio>
using namespace std;

int main() {

	// Initialization
	double x = 1.0;
	double product = 1.0;
	int counter = 0;
	int stable_counter = 0;

	while (!isinf(product))
	{
		counter++;											//counter increment
		product = product * 2.0;							// Multiplying with 2.0 in each iteration
		cout << counter << " " << product << endl;			// printing both iteration no. and the product
	}

	 stable_counter = counter - 1;	//Subtracting 1 as the final iteration leads to unstability
	 cout << stable_counter;		// Printing the no. of stable iteration
	 return 0;
}