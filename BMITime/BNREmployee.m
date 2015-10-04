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


// A Class extension - a set of declarations that is private. Only the class or instances of the class are able to use the properties, instance variables, or methods
//                     declared in a class extension.
/* Moving the office AlarmCode declaration from the BNREmployee.h file to a class extension here has two related effects:
 * 1). Objects that are not instance of BNREmployee can no longer see this property. Exmaple, a non-BNREmployee object could attempt to access an 
 * employee's alarm code like this:
 *      BNREmployee *mikey = [[BNREmployee alloc] init];
 *      unsigned int mikeysCode = mikey.officeAlarmCode;
 *  which results in a compiler error that reads "No visible @interface declares the instance method officeAlarmCode". The only interface that is visible
 * to a non-BNREmployee object is the BNREmployee header.
 *
 * 2). The BNREmployee header has one less declaration and thus a little bit simpler. This is a good thing. The header is intended to be a billboard;
 *     its job is to advertise what other developers need to know to make our class work in the code that they write. Too much information makes a header
 *     difficult for other developer to read and use.
 */
@interface BNREmployee ()
{
    NSMutableSet *_assets; //Instance variable to hold a pointer to the mutable array of assets
}
@property (nonatomic) unsigned int officeAlarmCode;
@end




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
        _assets = [[NSMutableSet alloc] init];
    }
    [_assets addObject:a];
    
    //In this method that adds the child to the parent's collection, set the child's pointer to point back to its 'holder'
    a.holder = self; //This prevents this object from being deallocated during garbage collection
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
