//
//  BNRPerson.m
//  BMITime
//
//  Created by Jose Luis Castillo on 9/25/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRPerson.h"

@implementation BNRPerson

//- (float)heightInMeters
//{
//    return _heightInMeters;
//}
//
//- (void)setHeightInMeters:(float)h
//{
//    _heightInMeters = h;
//}
//
//- (int)weightInKilos
//{
//    return _weightInKilos;
//}
//
//- (void)setWeightInKilos:(int)w
//{
//    _weightInKilos = w;
//}


- (float)bodyMassIndex
{
    //  'self' is a pointer to the object that is running the method.
    // It is used when an object wants to send a message to itself.
    float h = [self heightInMeters];
    return [self weightInKilos] / (h * h);
}

/* 'self' can also be used to let other objects know where the current object is
 * as shown in this example. Here 'self' is used to tell the array where the instance of 
 * BNRPerson lives. It is literally the BNRPerson instance's address. */
- (void)addYourselfToArray:(NSMutableArray *)theArray
{
    [theArray addObject:self];
}

@end
