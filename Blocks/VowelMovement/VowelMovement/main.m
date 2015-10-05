//
//  main.m
//  VowelMovement
//
//  Created by Jose Luis Castillo on 10/5/15.
//  Copyright © 2015 Jose Luis Castillo. All rights reserved.
//

/* This program explores the topic of 'Blocks' */

#import <Foundation/Foundation.h>

// Using tydef to define an Objective-C "Block"
/* Block syntax can be confusin, but can be made clearer using the typedef keyword.
 * Such code belongs to the top of the file or in a header outside of any method implementations. */
typedef void (^ArrayEnumerationBlock)(id, NSUInteger, BOOL *); // Block typedef only deines the block's arguments and return types; it has no bearing on the set of instructions within a block or that type


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // Create array of strings and a container for devowelized oned
        NSArray *originalStrings = @[@"Sauerkraut", @"Raygun", @"Big Nerd Ranch", @"Mississippi"];
        
        NSLog(@"original strings: %@", originalStrings);
        
        NSMutableArray *devowelizedStrings = [NSMutableArray array];
        
        // Create a list of characters to be removed from the string
        NSArray *vowels = @[@"a", @"e", @"i", @"o", @"u"];

        // Block variable declaration, the ^ indicates that this is a block
        //void (^devowelizer)(id, NSUInteger, BOOL *); // Block that takes an object, an integer, and a BOOL pointer, and returns nothing
        // Previous line eplaced: Now devowelizer can be declared using the new typedef
            ArrayEnumerationBlock devowelizer;
                                                    /* The three arguments of this block type are specifically designed for iterating through an array.
                                                     * The first is a pointer to the current object. Notice that this pointer's type is id so that it will work  no matter what kind of
                                                     * objects the array contains. The second argument is an NSUInteger that is the index of the current object. The third argumetn is 
                                                     * a pointer to a BOOL, which defaults to NO. Changing it to YES will stop executing the block after the current iteration. */
        
        
        // Compose a block and assign it tot he variable
        devowelizer = ^(id string, NSUInteger i, BOOL *stop) {
        
        // Search for a 'y' in any of the strings, then immediately stop execution and exit out of the program
        NSRange yRange = [string rangeOfString:@"y"
                                       options:NSCaseInsensitiveSearch];
            
        // Was 'y' found?
        if (yRange.location != NSNotFound) {
            *stop = YES;  // Prevent further itßerations
            return;       // End this iteration
        }
            
            
        // Make a mutable copy of the original string
        NSMutableString *newString = [NSMutableString stringWithString:string];
            
        // Iterate over the array of vowels, replacing occurences of each with an empty string
            for (NSString *s in vowels) {
                NSRange fullRange = NSMakeRange(0, [newString length]);
                [newString replaceOccurrencesOfString:s
                                           withString:@""
                                              options:NSCaseInsensitiveSearch
                                                range:fullRange];
            }
            
            // Add the new string to the array of devowelized strings, (which in turn assigns it to devowelizer)
            [devowelizedStrings addObject:newString];
            
        }; // End of block assignment
        
        
        // Send the enumerateObjectsUsingBlock: message with devowelizer to the array of original string and then print out the devowelized strings
        
        // Iterate over the array with the Block created above
        [originalStrings enumerateObjectsUsingBlock:devowelizer];
        NSLog(@"devowelied strings: %@", devowelizedStrings);
    }
    
    return 0;
}
