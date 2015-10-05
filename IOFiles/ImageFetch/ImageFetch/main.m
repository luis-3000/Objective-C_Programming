//
//  main.m
//  ImageFetch
//
//  Created by Jose Luis Castillo on 10/4/15.
//  Copyright © 2015 Jose Luis Castillo. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // Writing an NSData object to a file
        /* An NSData object represents a bugger of bytes. As an example we could fetch some data fromm a URL, we would
         * get in return an instance of NSData. Then we can ask the NSData to write itself to a file.*/
        
        // Fetch an image from the internet such as the logo from the Google website
        NSURL *url = [NSURL URLWithString:@"http://www.google.com/images/logos/ps_logo2.png"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        NSError *error = nil;
        
        // Save it into an instance of NSData
        NSData *data = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:NULL
                                                         error:&error];
        if (!data) {
            NSLog(@"fetch failed: %@", [error localizedDescription]);
            return 1;
        }
        
        NSLog(@"The file is %lu bytes", (unsigned long)[data length]);
        
        // Ask the NSData to write its buffer of bytes to a file
        BOOL written = [data writeToFile:@"/tmp/google.png"
                                 options:NSDataWritingAtomic // Make the file writing atomic in case of power failure
                                   error:&error];
        if (!written) {
            NSLog(@"write failed: %@", [error localizedDescription]);
            return 1;
        }
        
        NSLog(@"Success!");
        
        // Reading an NSData from a file
        /* An instance of NSData can be created from the contents of a file */
        NSData *readData = [NSData dataWithContentsOfFile:@"/tmp/google.png"];
        NSLog(@"The file read from the disk has %lu bytes", (unsigned long)[readData length]);
    }
    return 0;
}
