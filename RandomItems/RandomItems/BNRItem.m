//
//  BNRItem.m
//  RandomItems
//
//  Created by Jose Luis Castillo on 10/8/15.
//  Copyright © 2015 Jose Luis Castillo. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

- (void)setItemName:(NSString *)str
{
    _itemName = str;
}

- (NSString  *)itemName
{
    return _itemName;
}

- (void)setSerialNumber:(NSString *)str
{
    _serialNumber = str;
}

- (NSString *)serialNumber
{
    return _serialNumber;
}

- (void)setValueInDollars:(int)v
{
    _valueInDollars = v;
}

- (int)valueInDollars
{
    return _valueInDollars;
}

- (NSDate *)dateCreated
{
    return _dateCreated;
}

- (NSString *)description
{
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@",
     self.itemName,
     self.serialNumber,
     self.valueInDollars,
     self.dateCreated];
     
    return descriptionString;
}


// Implentation of the designated initializer
- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)sNumber;
{
    // Call the superclass's designated initializer
    self = [super init];
    
    // did the superclass's designated initializer succeed?
    if (self) {
        // Give the instance variables initial values
        _itemName = name;
        _serialNumber = sNumber;
        _valueInDollars = value;
        
        // Set _dateCreated to the current date and time (which is given by the instance pointed at of the NSDate class).
        _dateCreated = [[NSDate alloc] init];
    }
    
    // Return the address of the newly created instance  of this Object "initWithItemName", so that the 'caller' can assign it to a variable
    return self;
}


// Implementation of the second initializer
- (instancetype)initWithItemName:(NSString *)name
{
    return [self initWithItemName:name
                   valueInDollars:0
                     serialNumber:@""];
}

// Overriding "init" to call initWithItemName:,  passing a default value fot the item's name
- (instancetype)init{
    return [self initWithItemName:@"Item"];
}

// Implementation of class method to generate a random number
+ (instancetype)randomItem
{
    // Create an immutable array of three adjectives
    NSArray *randomAdjectiveList = @[@"Fluffy", @"Rusty", @"Shiny"];
    
    // Create and immutable array of three nouns
    NSArray *randomNounList = @[@"Bear", @"Spork", @"Mac"];
    
    // Get the index of a random adjective/noun from the lists
    // Note: The % operator, called the module operator, gives you the remainder.
    // So, AdjectiveIndex is a random number from 0 to 2 inclusive.
    NSInteger adjectiveIndex = arc4random() % [randomAdjectiveList count];
    NSInteger nounIndex = arc4random() % [randomNounList count];
    
    // Note that the NSInteger is not an obect, but a type definition for "long"
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                            randomAdjectiveList[adjectiveIndex],
                            randomNounList[nounIndex]];
                            
    int randomValue = arc4random() % 100;
                            
                            NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                                            '0' + arc4random() % 10,
                                                            'A' + arc4random() % 26,
                                                            '0' + arc4random() % 10,
                                                            'A' + arc4random() % 26,
                                                            '0' + arc4random() % 10];
                            
                            BNRItem *newItem = [[self alloc] initWithItemName:randomName
                                                               valueInDollars:randomValue
                                                                 serialNumber:randomSerialNumber];
    return newItem;
}

@end
