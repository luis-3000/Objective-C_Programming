//
//  main.m
//  DateList
//
//  Created by Jose Luis Castillo on 9/23/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Create three NSDate objects
        NSDate *now = [NSDate date];
        NSDate *tomorrow = [now dateByAddingTimeInterval:24.0 * 60.0 * 60.0];
        NSDate *yesterday = [now dateByAddingTimeInterval:-24.0 * 60.0 * 60.0];
        
        //Create an array containing all three
        NSArray *dateList = @[now, tomorrow, yesterday];
        
        // Iterate over the array
        NSUInteger dateCount = [dateList count];
        for(int i = 0; i < dateCount; i++) {
            NSDate *d = dateList[i];
            NSLog(@"Here is a date: %@", d);
        }
        
        // Iteraing over the array with 'fast enumeration'
        for(NSDate *d in dateList) {
            NSLog(@"Here is a date again: %@", d);
        }
        
        
        // Create an empty mutable array
        NSMutableArray *dateList2 = [NSMutableArray array];
        
        // Add two dates to the array
        [dateList2 addObject:now];
        [dateList2 addObject:tomorrow];
        
        // Add yesterday at the beginning of the list
        [dateList2 insertObject:yesterday atIndex:0];
        
        // Iterateover the array
        for (NSDate *d in dateList2) {
            NSLog(@"Here is a date from the mutable array: %@", d);
        }
        
        // Remove yesterday
        [dateList2 removeObjectAtIndex:0];
        NSLog(@"Now the first date is %@", dateList2[0]);
        
    }
    return 0;
}
