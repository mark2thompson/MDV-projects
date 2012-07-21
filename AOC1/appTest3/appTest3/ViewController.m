//
//  ViewController.m
//  appTest3
//
//  Created by Mark Thompson on 7/18/12.
//  Copyright (c) 2012 markthompson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //added viewDidAppear function
    //Call the Append function with two NSStrings. Capture the result and display a UIAlertView with the appended string using displayAlertWithString.
    
    
    //Call the Add function passing in two integer values. Capture the return of this function into a variable.
    
    
    
    //Bundle the returned integer into an NSNumber and then convert it to a NSString and pass it to the DisplayAlertWithString function.
    
    //Give it some text for the title. The message will read, "The number is 00". Replace the 00 with the integer passed into the function.
    
    //Call the Compare function with two integer values. If Compare returns true, display an UIAlertView both with the input values and the result using the DisplayAlertWithString function
    

}
//--------------------------------------------------------------------------------
//start of project3
//Create a function called Add. This function will take two NSInteger or int types and return the result of an addition between these two.

- (NSNumber *)Add:(NSInteger)firstNum  addNum:(NSInteger)secondNum 
{
    return [NSNumber numberWithInteger:(firstNum + secondNum)];
}


//Create a function called Compare that takes two NSInteger values. Return true or false based on whether the values are equal.

- (BOOL)Compare:(NSInteger)firstNum compNum:(NSInteger)secondNum 
{
    BOOL compBool;
    if (firstNum == secondNum) {
        compBool = YES;
    } else {
        compBool = NO;
    }
    return compBool;
}

//Create a function called Append. This function will take two NSStrings and return a new NSString containing the appended strings using an NSMutableString and the Append method.

- (NSString *)Append:(NSString *)firstString addString:(NSString *)secondString 
{
    return [NSString stringWithFormat:@"%@%@", firstString, secondString];
}


//Create a function called DisplayAlertWithString. This function will take as a parameter an NSString.
- (void)DisplayAlertWithString:(NSString *)string
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"This is my alert" message:string delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    if (alert != nil){
        
        [alert show];
    }
}
//--------------------------------------------------------------------------------

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
