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
        }
    
    
    [self.view addSubview:userName]; 
    [self.view addSubview:userField];
    
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
