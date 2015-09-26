//
//  BNRStockHolding.m
//  Stocks
//
//  Created by Jose Luis Castillo on 9/25/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRStockHolding.h"

@implementation BNRStockHolding

- (float)purchaseSharePrice
{
    return _purchaseSharePrice;
}

- (void)setPurchaseSharePrice:(float)psp
{
    _purchaseSharePrice = psp;
}

- (float)currentSharePrice
{
    return _currentSharePrice;
}

- (void)setCurrentSharePrice:(float)csp
{
    _currentSharePrice = csp;
}

- (int)numberOfShares
{
    return _numberOfShares;
}

- (void)setNumberOfShares:(int)numShares
{
    _numberOfShares = numShares;
}

- (float)costInDollars // purchaseSharePrice * numberOfShares
{
    return _purchaseSharePrice * _numberOfShares;
}

- (float)valueInDollars // currentSharePrice * numberOfShares
{
    return _currentSharePrice * _numberOfShares;
}

@end
