//
//  HypnosisViewController.m
//  Hypnosister
//
//  Created by Jose Luis Castillo on 10/9/15.
//  Copyright © 2015 Jose Luis Castillo. All rights reserved.
//

#import "HypnosisViewController.h"
#import "BNRHypnosisView.h"

@implementation HypnosisViewController

- (void)loadView
{
    // Create a view
    CGRect frame = [UIScreen mainScreen].bounds;
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] initWithFrame:frame];
    
    // Set it as *the* view of this view controller
    self.view = backgroundView;
}

@end
