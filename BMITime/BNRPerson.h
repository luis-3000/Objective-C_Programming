//
//  BNRPerson.h
//  BMITime
//
//  Created by Jose Luis Castillo on 9/25/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRPerson : NSObject

// Using 'properties' to automatically generate instance variables and accessor methods
@property (nonatomic) float heightInMeters;  // 'readwrite' property is deafault and does not have to be declared in the properties list ()
@property (nonatomic) int weightInKilos;

//{
//    //BNRPerson has two instance variables
//    float _heightInMeters;
//    int _weightInKilos;
//}

////BNRPerson has methods to read and set its instance variables
//- (float)heightInMeters;
//- (void)setHeightInMeters:(float)h;
//- (int)weightInKilos;
//- (void)setWeightInKilos:(int)w;


//BNRPerson has a method that calculates the Body Mass Index
- (float)bodyMassIndex;

@end
