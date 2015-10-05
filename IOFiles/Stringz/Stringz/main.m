//
//  main.m
//  Stringz
//
//  Created by Jose Luis Castillo on 10/4/15.
//  Copyright © 2015 Jose Luis Castillo. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // Create a string, and write it to the file system
        NSMutableString *str = [[NSMutableString alloc] init];
        
        for(int i = 0; i < 10; i++) {
            [str appendString:@"Jose Luis is cool!\n"];
        }
        
        // Handling errors while trying to write to the file:
        // Declare a pointer to an NSError object, but do not instantiate it.
        // The NSError instance will only be created if there is, in fact, an error.
        NSError *error;
        
        // Pass the NSError pointer by reference to the NSString method
        BOOL success = [str writeToFile:@"/tmp/cool.txt"
                        //[str writeToFile:@"/too/darned/bad.txt"   // I).To see errors comment previous line, uncomment this line
                             atomically:YES
                               encoding:NSUTF8StringEncoding
                                  error:&error];  //Pass a reference to 'error' because there is no object yet to pass
        // Test the return BOOL, and query the NSError if the write failed
        if (success) {
            NSLog(@"done writing /tmp/cool.txt");
             //NSLog(@"done writing /too/darned/bad.txt"); // II).To see errors comment previous line, uncomment this line
        } else {
            NSLog(@"writing /tmp/cool.txt failed: %@", [error localizedDescription]);
            //NSLog(@"writing /too/darned/bad.txt failed: %@", [error localizedDescription]); // III).To see errors comment previous line, uncomment this line
        }
        
        // Reading files with NSString
        NSError *error2;
        NSString *str2 = [[NSString alloc] initWithContentsOfFile:@"/etc/resolv.conf"
                                                         encoding:NSASCIIStringEncoding
                                                            error:&error2];
        if (!str2) {
            NSLog(@"read failed: %@", [error2 localizedDescription]); // print the error's localized description
        } else {
            NSLog(@"resolv.conf looks like this: %@", str2);
        }
        
    }
    return 0;
}
