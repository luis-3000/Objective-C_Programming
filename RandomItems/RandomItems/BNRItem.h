//
//  BNRItem.h
//  RandomItems
//
//  Created by Jose Luis Castillo on 10/8/15.
//  Copyright © 2015 Jose Luis Castillo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject

@property (nonatomic, strong)BNRItem *containedItem;
@property (nonatomic, weak)BNRItem *container;

@property (nonatomic, copy)NSString *itemName;
@property (nonatomic, copy)NSString *serialNumber;
@property (nonatomic)int valueInDollars;
@property (nonatomic, readonly, strong)NSDate *dateCreated;

// A Class method that will create a random item
+ (instancetype)randomItem;


// BNRItem initializers methods
//-----------------------------
// Designated initializer for BNRItem since it has the 3 variables that can be changed (are writable)
- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)sNumber;

- (instancetype)initWithItemName:(NSString *)name;


@end
