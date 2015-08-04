/* This program demonstrates the usage of the heap
 * by requesting a chunck of memory to be allocated
 * with malloc(). Then when done with the buffer
 * we release that memory with a call to free() 
 * and return that memory to the heap. */

 #include <stdio.h>
 #include <stdlib.h> //malloc() and free() are in stdlib.h

 int main(int argc, const char * argv[]) 
 {
 	//Declare a pointer
 	float * startOfBuffer;

 	//Ask to use some bytes from the ehap
 	startOfBuffer = malloc(1000 * sizeof(float));

 	// ... use the buffer here ...

 	/* Relinquish your claim on the memory so it can be 
 	 * reused */
 	free(startOfBuffer);

 	//Forget where that memory is
 	startOfBuffer = NULL;

 	return 0;
 }
 
