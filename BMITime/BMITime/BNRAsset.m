//
//  BNRAsset.m
//  BMITime
//
//  Created by Jose Luis Castillo on 9/29/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRAsset.h"
#import "BNREmployee.h"

@implementation BNRAsset

/* Overriding the description() from NSObject parent class. */
-(NSString *)description
{
    //return [NSString stringWithFormat:@"<%@: $%u>", self.label, self.resaleValue];
    
    // Is holder non-nil?
    if (self.holder) {
        return [NSString stringWithFormat:@"<%@: $%d, assigned to %@>", self.label, self.resaleValue, self.holder];
    } else {
        return [NSString stringWithFormat:@"<%@: $%d unassigned>", self.label, self.resaleValue];
    }
}

- (void)dealloc
{
    NSLog(@"deallocating %@", self);
}

@end
