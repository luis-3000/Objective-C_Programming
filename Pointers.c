/* Author: Jose Luis Castillo */
/* Exploring pointers in Objective-C  */
#include <stdio.h>
#include <math.h>

int main(int argc, const char * argv[]) {
	double pi = 3.14;
	double integerPart;
	double fractionPart;

	printf("Value of PI: %.2f\n", pi);

	//Pass the address of integerPart as an argument
	fractionPart = modf(pi, &integerPart);

	//Find teh value stored in intergerPart
	printf("Calling modf(), which separates the integer and the fraction parts of a number: \n");
	printf("integerPart = %.0f, factionPart = %.2f \n", integerPart, fractionPart);

	return 0;

}