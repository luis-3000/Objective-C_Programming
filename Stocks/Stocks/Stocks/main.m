//
//  main.m
//  Stocks
//
//  Created by Jose Luis Castillo on 9/25/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRStockHolding.h"

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        //Create three instances of the BNRStockHolding
        BNRStockHolding *stock1= [[BNRStockHolding alloc] init];
        BNRStockHolding *stock2= [[BNRStockHolding alloc] init];
        BNRStockHolding *stock3= [[BNRStockHolding alloc] init];
        
        // Give each instance variables interesting values using setters
        [stock1 setPurchaseSharePrice:100.0];
        [stock1 setCurrentSharePrice:110.0];
        [stock1 setNumberOfShares:1000];
        
        [stock2 setPurchaseSharePrice:200.0];
        [stock2 setCurrentSharePrice:220.0];
        [stock2 setNumberOfShares:2000];
        
        [stock3 setPurchaseSharePrice:300.0];
        [stock3 setCurrentSharePrice:330.0];
        [stock3 setNumberOfShares:3000];
        
        
        // Declare a mutable array
        NSMutableArray * myStocks = [NSMutableArray array];
        
        // Add the three stocks created above
        [myStocks addObject:stock1];
        [myStocks addObject:stock2];
        [myStocks addObject:stock3];
        
        NSInteger stockCount = [myStocks count]; //get a count for the items in the array
        for (int i = 0; i < stockCount; i++) {
            BNRStockHolding * s = myStocks[i];
            float cost = [s costInDollars];
            float value = [s valueInDollars];
            NSLog(@"\n\nStock %d:\n  Purchase Share Price: %f \n Current Share Price: %f \n Number Of Shares: %d \n Cost: %f \n Value: %f \n", i+1, [s purchaseSharePrice], [s currentSharePrice], [s numberOfShares], cost, value);
        }
        
    }
    
    return 0;
}
