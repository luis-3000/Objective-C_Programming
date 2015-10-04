//
//  main.m
//  BMITime
//
//  Created by Jose Luis Castillo on 9/25/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNREmployee.h"
#import "BNRAsset.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        // Create an array of BNREmployee objects
        NSMutableArray *employees = [[NSMutableArray alloc] init];
        
        // Create a dcitionary of executives
        NSMutableDictionary *executives = [[NSMutableDictionary alloc] init];
        
        for (int i = 0; i < 10; i++) {
            // Create an instance of BNREmployee
            BNREmployee *mikey = [[BNREmployee alloc] init];
            
            // Give the istance variables interesting values
            mikey.weightInKilos = 90 + i;
            mikey.heightInMeters = 1.8 - i/10.0;
            mikey.employeeID = i;
            
            // Put the employee in the employees array
            [employees addObject:mikey];
            
            // Is this the first employee?
            if (i == 0) {
                [executives setObject:mikey forKey:@"CEO"];
            }
            
            // Is this the second employee?
            if (i == 1) {
                [executives setObject:mikey forKey:@"CTO"];
            }
        }
        
        //An array for all assets, as they are created.
        NSMutableArray *allAssets = [[NSMutableArray alloc] init];
        
        // Print out the entire dictionary
        NSLog(@"executives; %@", executives);
        
        
        // Print out the CEO's information
        NSLog(@"CEO: %@", executives[@"CEO"]);
        executives = nil;
        
        // Create 10 assets
        for (int i = 0; i < 10; i++) {
            // Create an asset
            BNRAsset *asset = [[BNRAsset alloc] init];
            
            // Give it an interesting label
            NSString *currentLabel = [NSString stringWithFormat:@"Laptop %d", i];
            asset.label = currentLabel;
            asset.resaleValue = 350 + i * 17;
            
            // Get a random number bewteen 0 and 9 inclusive
            NSUInteger randomIndex = random() % [employees count];
            
            // Find that employee
            BNREmployee *randomEmployee = [employees objectAtIndex:randomIndex];
            
            // Assign the asset to the employee
            [randomEmployee addAsset:asset];
            
            [allAssets addObject:asset]; // Add them as they are created
        }
        
        // Sort by Value of assets
        NSSortDescriptor *voa = [NSSortDescriptor sortDescriptorWithKey:@"valueOfAssets"
                                                              ascending:YES];
        
        // Sort by Employee id
        NSSortDescriptor *eid = [NSSortDescriptor sortDescriptorWithKey:@"employeeID"
                                                              ascending:YES];
        
        // Print them
        NSLog(@"\nSorting first by Value of assets and then by employee id:");
        [employees sortUsingDescriptors: @[voa, eid]];
                                 
        NSLog(@"Employees: %@", employees);
        
        NSLog(@"Giving up ownership of one employee");
        
        [employees removeObjectAtIndex:5];
        
        NSLog(@"allAssets: %@", allAssets); // Show them all
        
        // Filter the collection based on a logical statement
        NSPredicate *predicate = [NSPredicate predicateWithFormat:
                                  @"holder.valueOfAssets > 70"];
        NSArray *toBeReclaimed = [allAssets filteredArrayUsingPredicate:predicate];
        NSLog(@"toBeReclaimed: %@", toBeReclaimed);
        toBeReclaimed = nil;
        
        NSLog(@"Giving up ownership of arrays");
        
        
        allAssets = nil; // Free up the objects' memory
        employees = nil;
        
    }
    
    return 0;
}


/*   PREVIOUS EXERCISE ON THIS FILE
 // Create an instance of BNREmployee
 BNREmployee *mikey = [[BNREmployee alloc] init];
 
 // Give the instance variables interesting values using setters
 //[mikey setWeightInKilos:96];
 //[mikey setHeightInMeters:1.8];
 mikey.weightInKilos = 96;        //Using 'dot notation' instead. Using a setter method
 mikey.heightInMeters = 1.8;
 mikey.employeeID = 12;
 
 //mikey.hireDate = [NSDate dateWithNaturalLanguageString:@"September 26th, 2015"];
 //WARNING: dateWithNaturalLanguageString has been deprecated as of OS X 10.10, here is the fix:
 NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
 [formatter setDateFormat:@"M d, y"];
 NSDate *result = [formatter dateFromString:@"Aug 02, 2010"];
 mikey.hireDate = result;
 
 
 // Log the instance variables using the getters
 //float height = [mikey heightInMeters];
 //int weight = [mikey weightInKilos];
 float height = mikey.heightInMeters; // using a getter method
 int weight = mikey.weightInKilos;
 NSLog(@"mikey is %.2f meters tall and weighs %d kilograms", height, weight);
 
 //Use BNREmployee's new implementation of description()
 NSDate *date = mikey.hireDate;
 //NSLog(@"Employee %d hired on %@", mikey.employeeID, mikey.hireDate);
 NSLog(@"%@ hired on %@", mikey, date);
 
 // Log some values using custom methods
 float bmi = [mikey bodyMassIndex];
 NSLog(@"mikey has a BMI of %f", bmi);
 double years = [mikey yearsOfEmployment];
 NSLog(@"BMI of %.2f, has worked with us for %.2f years", bmi, years);
*/