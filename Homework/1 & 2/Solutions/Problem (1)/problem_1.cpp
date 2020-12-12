// All includes //
#include <iostream>
#include <fstream>
#include <math.h>

using namespace std;

// function declaration //
double exact_solution(double z);

#define n 21

int main() {
	
	// Initialization //
	const double t = 2;
	double first_derivative = 9 * exp(- t) / ((1 + 9 * exp(-t)) * (1 + 9 * exp(-t)));

	double del_t[21] = {0};
	double first_principal[21] = {0};
	double absolute_error[21] = {0};
	std::ofstream pfile("problem_1.txt"); // designates and opens a text file to store output data

	for (int i = 0; i<n; i++) {				// iterates over i
		del_t[i] = pow(10.0, (double)-i);	// upgrades del_t after each iteration
		pfile << del_t[i];					// stores del_t in the output file
		first_principal[i] = (exact_solution(t + del_t[i]) - exact_solution(t)) / del_t[i];	// upgrades first_principal after each iteration
		absolute_error[i] =  abs(first_derivative - first_principal[i]);	// upgrades absolute_error after each iteration
		pfile << "," << absolute_error[i] << "\n";							// stores absolute_error in the output file
		cout << del_t[i] << " " << absolute_error[i] << endl;
	}

	pfile.close(); // closes the text file

	return 0;
}
	
// Function Definition// 
double exact_solution(double z) {
	return 1 / (1 + 9 * exp(-z));
}