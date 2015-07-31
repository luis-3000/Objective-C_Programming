/* Structs
 * This program demostrates the usage of "Structs"
 * 
 * This program computes a person's Body Mass Index, or BMI. 
 * BMI a person's weight in kilograms divided by the square of the
 * person's height in meters. (It's a very imprecise tool for
 * measruging a person's fitness, but it makes a good 
 * programming example.) 
 * 
 * 
 */
 #include <stdio.h>

 //This is the declaration of a struct
 struct Person {
 	float heightInMeters;
 	int wightInKilos;
 };

 int main(int garc, const char* argv[]) {
 	struct Person Jose;
 	Jose.heightInMeters = 1.73;
 	Jose.weightInKilos = 96;

 	struct person aaron;
 	aaron.heightInMeters = 1.97;
 	aaron.weightInKilos = 84;

 	printf("Jose is %.2f meters tall\n", Jose.heightInMeters);
 	printf("Jose weighs %d kilograms\n", Jose.weightInKilos);
 
 	printf("Aaron is %.2f meters tall\n", aaron.heightInMeters);
 	printf("Aaron weighs %d kilograms\n", aaron.weightInKilos);
 }