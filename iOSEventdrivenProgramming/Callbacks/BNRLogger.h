//
//  BNRLogger.h
//  Callbacks
//
//  Created by Jose Luis Castillo on 10/4/15.
//  Copyright © 2015 Jose Luis Castillo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRLogger : NSObject
    //Implement the callback methods via the corresponding protocols
    <NSURLConnectionDelegate, NSURLConnectionDataDelegate>
{
    NSMutableData *_incomingData;
}

@property (nonatomic) NSDate *lastTime; // HOlds a date
- (NSString *)lastTimeString; // Returns the date as a string
- (void)updateLastTime:(NSTimer *)t; // Action method to be triggered by the timer

@end
