//
//  BNREmployee.h
//  BMITime
//
//  Created by Jose Luis Castillo on 9/26/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BNRPerson.h"
@class BNRAsset; //Tells the compiler that the class BNRAssets in mentioned in this file so that it does not throw errors
                 //Using @class instead of @import gives the commpiler less information but makes the processing of this particular file faster.

@interface BNREmployee : BNRPerson



@property (nonatomic) unsigned int employeeID;
@property (nonatomic) NSDate *hireDate; //Points to another object
@property (nonatomic, copy) NSArray *assets; //This tells other classes then when they call the 'assets' they are going to get something
                                             // that is not mutable. However, the _assets array is actually an instance of NSMutableArray so that
                                             // items can be added or removed in BNREmployee.m . That is why I am declaring a property and an instance
                                             // variable, since in this case, the type of the property and the type of the instance variable are not the same.
- (double)yearsOfEmployment;
- (void)addAsset:(BNRAsset *)a;
- (unsigned int)valueOfAssets;

@end
