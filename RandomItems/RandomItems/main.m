/*
//
//  main.m
//  RandomItems
//
//  Created by Jose Luis Castillo on 10/8/15.
//  Copyright © 2015 Jose Luis Castillo. All rights reserved.
//
*/

#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Create a mutable array object, store its address in items variable
        NSMutableArray *items = [[NSMutableArray alloc] init];
/*
//        // Send the message addObject: to the NSMutableArray pointed to by the
//        // variable items, passing a string each time
//        [items addObject:@"One"];
//        [items addObject:@"Two"];
//        [items addObject:@"Three"];
//        
//        // Send another message, insertObject:atIndex:, to that same array object
//        [items insertObject:@"Zero" atIndex:0];
//        
//        // Using 'Fast enumeration', iterate over the array and pring the items
//        for (NSString *item in items) {
//            // Log the description of the item
//            NSLog(@"%@", item);
//        }
//        
////        // Create an instance of BNRItem and log its instance variable to the console
////        BNRItem *item = [[BNRItem alloc] init];
////        
////        // Create and NSString, "Red "Sofa" and give it to the BNRItem
////        //[item setItemName:@"RedSofa"];
////        item.itemName = @"Red Sofa";     // Using 'dot notation' alternatively
////        
////        // Create another NSString, "A1B2C" and give it to the BNRItem
////        //[item setSerialNumber:@"A1B2C"];
////        item.SerialNumber = @"A1B2C";
////        
////        // Set the valueInDollars
////        //[item setValueInDollars:100];
////        item.valueInDollars = 100;
//        
//        // Instantiate an object of BNRItem using designated initializers
//        BNRItem *item = [[BNRItem alloc] initWithItemName:@"Red Sofa"
//                                          valueInDollars:100
//                                            serialNumber:@"A1B2C"];
//        
//        
//        //NSLog(@"%@ %@ %@ %d", [item itemName], [item dateCreated], [item serialNumber], [item valueInDollars]);
//        //NSLog(@"%@ %@ %@ %d", item.itemName, item.dateCreated, item.serialNumber, item.valueInDollars);
//        // Replaced: Printing with the 'description' of the item. The %@ token is replaced with the result of
//        // sending the description message to the corresponding argument
//        NSLog(@"%@", item);
//        
//        // Confirming default initializer
//        BNRItem *itemWithName = [[BNRItem alloc] initWithItemName:@"Blue Sofa"];
//        NSLog(@"%@", itemWithName);
//        
//        // Confirming seond initializer
//        BNRItem *itemWithNoName = [[BNRItem alloc] init];
//        NSLog(@"%@", itemWithNoName);
*/
        
        
        // Creating random BNRItem instances
        for (int i = 0; i < 10; i++) {
            BNRItem *item = [BNRItem randomItem];
            [items addObject:item];
        }

//        // Introducing 'strong reference cycle' as an experiment
//        BNRItem *backpack = [[BNRItem alloc] initWithItemName:@"Backpack"];
//        [items addObject:backpack];
//        
//        BNRItem *calculator = [[BNRItem alloc] initWithItemName:@"Calculator"];
//        [items addObject:calculator];
//        
//        backpack.containedItem = calculator; // These two objects now have references to each other, thus creating the "strong reference cycle"
//        
//        backpack = nil;
//        calculator = nil;
        
        for (BNRItem *item in items) {
            NSLog(@"%@", item);
        }
        
        NSLog(@"Setting items to nil ... ");
        // Destroy the mutable array object (to free up memory)
        items = nil;
    }
    return 0;
}
