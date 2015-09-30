//
//  BNRAsset.m
//  BMITime
//
//  Created by Jose Luis Castillo on 9/29/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRAsset.h"

@implementation BNRAsset

/* Overriding the description() from NSObject parent class. */
-(NSString *)description
{
    return [NSString stringWithFormat:@"<%@: $%u>", self.label, self.resaleValue];
}

- (void)dealloc
{
    NSLog(@"deallocating %@", self);
}

@end
