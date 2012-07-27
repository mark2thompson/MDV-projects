//
//  ViewController.m
//  appTest4
//
//  Created by Mark Thompson on 7/26/12.
//  Copyright (c) 2012 markthompson. All rights reserved.
//

#import "ViewController.h"
#define button_zero 0
#define button_one 1
#define button_two 2

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    //Create a UILabel near the top of your screen with teh text "Username:" in it.
    UILabel *userName = [[UILabel alloc]initWithFrame:CGRectMake(0, 15.0f, 100.0f, 20.0f)];
    if (userName != nil)
    {
        userName.text = @"Username: ";
    };
    //Create a UITextField to the right of the username label
    userField = [[UITextField alloc]initWithFrame:CGRectMake(90.0f, 10.0f, 220.0f, 30.0f)];
    if (userField != nil)
    {
        userField.borderStyle = UITextBorderStyleRoundedRect;
       
        
    };
    //Create a rounded rectangle UIButton of any color under the UITextField with the text "Login" on it.
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    if (loginButton != nil)
    {
        loginButton.frame = CGRectMake(210.0f, 60.0f, 100.0f, 30.0f);
        [loginButton setTitle:@"Login" forState:UIControlStateNormal];
        //Add a target to the UIButton to call a function called onClick when the user presses the Login button.
        loginButton.tag = button_zero;
        [loginButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    };
    //Create another UILabel beneath with the default text "Please Enter Username".
    unDialog = [[UILabel alloc]initWithFrame:CGRectMake(0, 120.0f, 320.0f, 60.0f)];
    if (unDialog != nil)
    {
        unDialog.text = @"Please Enter Username";
        unDialog.textAlignment = UITextAlignmentCenter;
        unDialog.backgroundColor = [UIColor grayColor];
        unDialog.textColor = [UIColor whiteColor];
    };       
    //Create a UIButton using the rounded rectangle type. Give this button any color you wish.
    UIButton *dateButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    if (dateButton != nil)
    {
        dateButton.frame = CGRectMake(0, 230.0f, 100.0f, 30.0f);
        //Add the text "Show Date" to the button
        [dateButton setTitle:@"Show Date" forState:UIControlStateNormal];
        //Add an action to the button that when clicked, it will call the same onClick handler you already defined. Make sure to add a tag to the date button so you know which one was pressed.
        dateButton.tag = button_one;
        [dateButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    };
    //Create a UIButton using either the light or dark info type and position it somewhere near the bottom of the screen.        
    UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeInfoDark];
    if (infoButton != nil)
    {
        infoButton.frame = CGRectMake(10.0f, 360.0f, 25.0f, 25.0f);
        infoButton.tag = button_two;
        [infoButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    //Create a UILabel beneath it that contains no initial text.
    blankLabel = [[UILabel alloc]initWithFrame:CGRectMake(10.0f, 400.0f, 320.0f, 40.0f)];
    if (blankLabel != nil)
    {
        blankLabel.numberOfLines = 0;
    };
    
    [self.view addSubview:userName]; 
    [self.view addSubview:userField];
    [self.view addSubview:loginButton];
    [self.view addSubview:unDialog];
    [self.view addSubview:dateButton];
    [self.view addSubview:infoButton];
    [self.view addSubview:blankLabel];
    
}
//onClickfunction

-(void)onClick:(UIButton*)loginButton
{
    if (loginButton.tag == button_zero)
    {
     //If the user has not entered any text into the UITextField, display in the UILabel, "Username cannot be empty". Otherwise, display "User: username has been logged in".   
        if (userField.text.length > 0)
            {
                [unDialog resignFirstResponder];
                NSString *logged = [NSString stringWithFormat:@"User: %@ has been logged in", userField.text, nil];
                unDialog.text = logged;
                [userField endEditing:YES];
            }
        else 
            {
            [unDialog resignFirstResponder];
            unDialog.text = @"Username cannot be empty";
            }
    }
    else if(loginButton.tag == button_one)
    {
        //Display a UIAlertView with the current date and time displayed in the format seen in the dateAlert graphic in the assets section of this project assignment. You can either format the date and time manually or use the date and time styles. You must use an NSDate object to gather the date and time information.
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"HH:mm MMMM dd, yyyy"];
        
        NSDate *date = [NSDate date];
        
        NSString *formattedDateString = [dateFormatter stringFromDate:date];
        NSLog(@"formattedDateString: %@", formattedDateString);
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Date" message:(@"formattedDateString: %@", formattedDateString) delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        if (alertView != nil)
        {
            [alertView show];
        }
    }
    else if(loginButton.tag == button_two)
    //When the button is pressed, have the text "This application was created by: Firstname Lastname" appear in the info UILabel. Please replace firstname lastname with your name.
        {
            blankLabel.text = @"This application was created by: Mark Thompson";
        }
};


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
