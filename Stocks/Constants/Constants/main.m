//
//  main.m
//  Constants
//
//  Created by Jose Luis Castillo on 10/3/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSLog(@"\u03c0 is %f", M_PI);
        NSLog(@"%d is larger", MAX(10, 12));
        
        NSLocale *here = [NSLocale currentLocale];
        NSString *currency = [here objectForKey:NSLocaleCurrencyCode]; // NSLocaleCurrenceCode is a 'global variable'
        NSLog(@"Money at your current location is valued in  %@", currency);
    }
    return 0;
}
