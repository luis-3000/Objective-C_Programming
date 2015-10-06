//
//  AppDelegate.h
//  iToDoList
//
//  Created by Jose Luis Castillo on 10/5/15.
//  Copyright © 2015 Jose Luis Castillo. All rights reserved.
//

#import <UIKit/UIKit.h> /* Framework that contains most of the iOS-specific classes, like UITableView, UITextField and UIButton. */

@interface AppDelegate : UIResponder <UIApplicationDelegate> /* AppDelegate is a subclass of UIResponder  and comforms to the UIApplicationDelegate protocol. */

@property (strong, nonatomic) UIWindow *window; /* Object that fills the screen of the iOS application. */

@property (nonatomic) UITableView *taskTable; // TableView that will display all the tasks to be done
@property (nonatomic) UITextField *taskField; // Text Field where a new task can be entered
@property (nonatomic) UIButton *insertButton; // Adds the new task to the table

@property (nonatomic) NSMutableArray *tasks; // Where the tasks will be stored as strings

- (void)addTask:(id)sender;

@end

