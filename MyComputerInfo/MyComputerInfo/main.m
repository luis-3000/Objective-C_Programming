//
//  main.m
//  MyComputerInfo
//
//  Created by Jose Luis Castillo on 9/20/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //My computer's information
        //Create a NSHost object/instance for this computer
        NSHost *myComputerCompleteInfo = [NSHost currentHost];
        
        //Get the name for this computer by passing to the instance of NSHost
        //just created above the localizedName message/method which returns
        //a pointer to an instance of NSString
        NSString *myComputerName = [myComputerCompleteInfo localizedName];
        
        //print the name of this computer
        NSLog(@"The name of this computer is: %@", myComputerName);
        
        NSCalendar *cal = [NSCalendar currentCalendar];
        NSLog(@"My calendar is %@", [cal calendarIdentifier]);
        
        unsigned long day = [cal ordinalityOfUnit:NSDayCalendarUnit
                                           inUnit:NSMonthCalendarUnit
                                          forDate:now];
        NSLog(@"This is day %lu of the month ", day);
    }
    return 0;
}
