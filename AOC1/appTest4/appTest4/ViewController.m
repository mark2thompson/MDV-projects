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
    UILabel *userName = [[UILabel alloc]initWithFrame:CGRectMake(0, 10.0f, 320.0f, 20.0f)];
    if (userName != nil)
    {
        userName.text = @"Username: ";
    };
    
    
    
    
   [self.view addSubview:userName]; 
    
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
