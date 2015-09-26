//
//  BNRStockHolding.h
//  Stocks
//
//  Created by Jose Luis Castillo on 9/25/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRStockHolding : NSObject
{
    float _purchaseSharePrice;
    float _currentSharePrice;
    int _numberOfShares;
}

- (float)purchaseSharePrice;
- (void)setPurchaseSharePrice:(float)psp;
- (float)currentSharePrice;
- (void)setCurrentSharePrice:(float)csp;
- (int)numberOfShares;
- (void)setNumberOfShares:(int)numShares;
- (float)costInDollars; // purchaseSharePrice * numberOfShares
- (float)valueInDollars; // currentSharePrice * numberOfShares

@end
