//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Jose Luis Castillo on 10/9/15.
//  Copyright © 2015 Jose Luis Castillo. All rights reserved.
//

#import "BNRHypnosisView.h"

@implementation BNRHypnosisView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

 - (void)drawRect:(CGRect)rect
{
     // Drawing code
     CGRect bounds = self.bounds;
     
     // Gifure out the center of the bounds rectangle
     CGPoint center;
     center.x = bounds.origin.x + bounds.size.width /2.0;
     center.y = bounds.origin.y + bounds.size.height /2.0;
    
    // The circle will be the largest that will fit in the view
    //float radius = MIN(bounds.size.width, bounds.size.height) / 2.0;
    // Drawing multiple circles instead
    // The largest circle will circumscribe the view
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    // Define a path to draw a circle
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
//    // Add an arc to the path at center, with radius of radius,
//    // from 0 to 2*PI radians (a circle)
//    [path addArcWithCenter:center
//                    radius:radius
//                startAngle:0.0
//                  endAngle:M_PI * 2.0
//                 clockwise:YES];

    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        
        // Pick up the 'drawing pencil' and move it to the next circle (in order to have truly concentric circles)
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        
        [path addArcWithCenter:center
                        radius:currentRadius // Note this is currentRadius!
                    startAngle:0.0
                      endAngle:M_PI * 2.0
                     clockwise:YES];
    }
    
    // Configure the line width to  10 points
    path.lineWidth = 10;
    
    // Configure the drawing color to light gray
    [[UIColor lightGrayColor] setStroke];
    
    // Send a message to the UIBezierPath that tells it to draw
    // Draw the line!
    [path stroke];  // stroke is the method in UIBezeirPath that tells the 'path' instance to draw
}



- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
     //Override point for customization after application launch
     return YES;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // All BNRHypnosisViews start with a clear background coloe
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


@end
