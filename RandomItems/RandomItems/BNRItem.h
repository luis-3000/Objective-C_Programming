//
//  BNRItem.h
//  RandomItems
//
//  Created by Jose Luis Castillo on 10/8/15.
//  Copyright © 2015 Jose Luis Castillo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject
{
    // Instance variables of BNRItem
    NSString *_itemName;
    NSString *_serialNumber;
    int _valueInDollars;
    NSDate *_dateCreated;
    
    // Introducing 'strong reference cycle' as an experiment
    BNRItem *_containedItem;
    BNRItem *_container;
}

// A Class method that will create a random item
+ (instancetype)randomItem;


// Getters and Setters
- (void)setItemName:(NSString *)str;
- (NSString *)itemName;

- (void)setSerialNumber:(NSString *)str;
- (NSString *)serialNumber;

- (void)setValueInDollars:(int)v;
- (int)valueInDollars;

- (NSDate *)dateCreated;

// BNRItem initializers methods

// Designated initializer for BNRItem since it has the 3 variables that can be changed (are writable)
- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)sNumber;

- (instancetype)initWithItemName:(NSString *)name;


// Introducing 'strong reference cycle' as an experiment
- (void)setContainedItem:(BNRItem *)item;
- (BNRItem *)containedItem;

- (void)setContainer:(BNRItem *)item;
- (BNRItem *)container;

@end
