// All includes//
#include <iostream>
#include <math.h>

using namespace std;

int main(){
	// Initialization
	int x = 1;
	int product = 1;
	int counter = 0;
	int stable_counter = 0;

	while (product > 0 )
	{
		counter++;										// increment
		product = product * 2;							// multiplying with 2 in each iteration
		cout << counter << " " << product << endl;		// printing both iteration no. and the product
	}

	stable_counter = counter - 1;		// Subtracting 1 as the final iteration leads to unstability
	cout << stable_counter;				// Printing the no. of stable iteration
	return 0;
}