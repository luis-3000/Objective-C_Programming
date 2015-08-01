/* Most of the time, you use a struct declaration over and over again. 
 * So it is common to create a typedef for the struct type. A typdef
 * defines an alias for a type declaration and allows you to use it
 * more like the usual data types. In this program we use a typedef
 * for 'struct' Person. */

#include <stdio.h>

 typedef struct {
 	float heightInMeters;
 	int weightInKilos;
 } Person;

 /* Thanks to the new typedef  we can pass a Person to another function.
  * We can add a function named bodyMassIndex() that accepts a Person
  * as a parameter and caoculates BMI. Then, we can update main() to 
  * call this function. */

float bodyMassIndex(Person p)
{
	return p.weightInKilos / (p.heightInMeters * p.heightInMeters);
}

 int main(int argc, const char * argv[])
 {
 	Person Jose;
 	Jose.heightInMeters = 1.73;
 	Jose.weightInKilos = 96;

 	Person Aaron;
	Aaron.heightInMeters = 1.97;
 	Aaron.weightInKilos = 87;

 	printf("Using typef struct to define our data type: \n");
 	//printf("Jose is %.2f meters tall\n", Jose.heightInMeters);
 	//printf("Jose weighs %d kilograms\n", Jose.weightInKilos);
 	//printf("\nAaron is %.2f meters tall\n", Aaron.heightInMeters);
 	//printf("Aaron weighs %d kilograms\n", Aaron.weightInKilos);

 	float bmi;
 	bmi = bodyMassIndex(Jose);
 	printf("Jose has a BMI of %.2f\n", bmi);

 	bmi = bodyMassIndex(Aaron);
 	printf("Aaron has a BMI of %.2f\n", bmi);

 	return 0;
 }