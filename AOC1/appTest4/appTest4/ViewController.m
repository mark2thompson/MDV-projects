//
//  ViewController.m
//  appTest4
//
//  Created by Mark Thompson on 7/26/12.
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
    self.view.backgroundColor = [UIColor whiteColor];
    //Create a UILabel near the top of your screen with teh text "Username:" in it.
    UILabel *userName = [[UILabel alloc]initWithFrame:CGRectMake(0, 15.0f, 100.0f, 20.0f)];
    if (userName != nil)
    {
        userName.text = @"Username: ";
    };
    //Create a UITextField to the right of the username label
    UITextField *userField = [[UITextField alloc]initWithFrame:CGRectMake(90.0f, 10.0f, 220.0f, 30.0f)];
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
        
    };
    //Create another UILabel beneath with the default text "Please Enter Username".
    UILabel *unDialog = [[UILabel alloc]initWithFrame:CGRectMake(0, 120.0f, 320.0f, 60.0f)];
    if (unDialog != nil)
    {
        unDialog.text = @"Please Enter Username";
        unDialog.textAlignment = UITextAlignmentCenter;
        unDialog.backgroundColor = [UIColor grayColor];
        unDialog.textColor = [UIColor whiteColor];
    };
    
    
    [self.view addSubview:userName]; 
    [self.view addSubview:userField];
    [self.view addSubview:loginButton];
    [self.view addSubview:unDialog];
    
}

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
