#include <stdio.h>
#include <math.h>

/* This program demonstrates the usage of the Pass-by-Reference concept. */

/* This function assumes that 'meters' is a non-negative value. */
void metersToFeetAndInches(double meters, unsigned int *ftPtr, double *inchesPtr)
{
	//First, convert the number of meters into a floating-point number of feet
	double rawFeet = meters * 3.281;

	//Then, calculate how many complete feet there are as an unsigned int?
	unsigned int feet = (unsigned int)floor(rawFeet);

	//Avoiding derefencing a NULL pointer
	if(ftPtr) {   //if ftPtr is not NULL
		//Store the number of feet as the supplied daddress
		printf("Storing %u to the address %p\n", feet, ftPtr);
		*ftPtr = feet;
	}

	//Then, calculate the inches
	double fractionalFoot = rawFeet - feet;
	double inches = fractionalFoot * 12.0;

	//Again, avoiding dereferencing a NULL pointer
	if(inchesPtr) {  //if inchesPtr is not NULL
		//Finally, store the number of inches at the supplied address
		printf("Storing %.2f to the address %p\n", inches, inchesPtr);
		*inchesPtr = inches;
	}
}

int main(int argc, const char * argv[])
{
	double meters = 3.0;
	unsigned int feet;
	double inches;

	metersToFeetAndInches(meters, &feet, &inches);
	printf("%.1f meters is equal to %d feet and %.1f inches.", meters, feet, inches);

	return 0;
}