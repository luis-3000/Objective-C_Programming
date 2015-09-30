//
//  BNREmployee.m
//  BMITime
//
//  Created by Jose Luis Castillo on 9/26/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNREmployee.h"
#import "BNRAsset.h"    //To process this program the compiler needs to know a lot about the BNRAsset class.
                        // Reason why I have imported BNRAsset.h instead of using @class


@implementation BNREmployee

// Accessors for assets properties
- (void)setAssets:(NSArray *)a
{
    _assets = [a mutableCopy];
}


- (NSArray *)assets
{
    return [_assets copy];
}


- (void)addAsset:(BNRAsset *)a
{
    // Is assets nil?
    if (!_assets) {
        // Create the array
        _assets = [[NSMutableArray alloc] init];
    }
    [_assets addObject:a];
}


- (unsigned)valueOfAssets
{
    // Sum up the resale value of the assets
    unsigned int sum = 0;
    
    for (BNRAsset *a in _assets) {
        sum += [a resaleValue];
    }
    return sum;
}


- (double)yearsOfEmployment
{
    //Do I have a non-nil hireDate?
    if (self.hireDate) {
        //NSTimeInterval is the same as double
        NSDate *now = [NSDate date];
        NSTimeInterval secs = [now timeIntervalSinceDate:self.hireDate];
        return (secs / 31557600.0); // Seconds per year
    } else {
        return 0;
    }
}


/* Override:
 * Overrides its parent class' method. */
- (float)bodyMassIndex
{
    float normalBMI = [super bodyMassIndex];
    return normalBMI * 0.9;
}


/* Returns a string that describes an instance of BNREMployee */
- (NSString *)description
{
    //return [NSString stringWithFormat:@"<Employee %d>", self.employeeID];
    
    //To track the deallocatio of BNREmployee instances, the above line needs to be modified
    // and a dealloc() needs to be implemeted below
    return [NSString stringWithFormat:@"<Employee %u: $%u in assets>", self.employeeID, self.valueOfAssets];
}

- (void)dealloc
{
    NSLog(@"deallocating %@", self);
}


@end
