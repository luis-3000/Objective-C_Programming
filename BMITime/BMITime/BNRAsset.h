//
//  BNRAsset.h
//  BMITime
//
//  Created by Jose Luis Castillo on 9/29/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BNREmployee; // Pointer instance variable to hold on to the holding employee

@interface BNRAsset : NSObject

@property (nonatomic, copy) NSString *label;
@property (nonatomic, weak) BNREmployee *holder; //Makes 'holder' a "weak" reference - a pointer that does not imply ownership
@property (nonatomic) unsigned int resaleValue;

@end
