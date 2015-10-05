//
//  main.m
//  Callbacks
//
//  Created by Jose Luis Castillo on 10/4/15.
//  Copyright © 2015 Jose Luis Castillo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRLogger.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Event driven programming with objective-c via Callbacks
        /* A Callback allow us to write a piece of code and then associate that code with a particular event. When the event happens the code is executed. */
        
        
         // Target-action callback
        BNRLogger *logger = [[BNRLogger alloc] init];
        
        
        // Notification callback
        // Register the instance of BNRLogger to receive a notification when the time zone changes
        [[NSNotificationCenter defaultCenter]
                                addObserver:logger
                                   selector:@selector(zoneChange:)
                                       name:NSSystemTimeZoneDidChangeNotification
                                     object:nil];
        
        NSURL *url = [NSURL URLWithString:@"http://www.gutenberg.org/cache/epub/205/pg205.txt"];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        _unused NSURLConnection *fetchConn = [[NSURLConnetion alloc] initWithRequest:request
                                                                            delegate:logger
                                                                    startImmediately:YES];
        
       _unused NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0
                                                          target:logger
                                                        selector:@selector(updateLastTime:)
                                                       userInfor:nil
                                                         repeats:YES];
        
        [[NSRunLoop currentRunLoop] run]; //NSRunLoop is the object that does the waiting for events to happen
        
        
       
        
    }
    return 0;
}
