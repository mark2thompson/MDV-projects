//
//  ViewController.m
//  objc2Project1
//
//  Created by Mark Thompson on 8/2/12.
//  Copyright (c) 2012 markthompson. All rights reserved.
//

#import "ViewController.h"
#import "appleBase.h"
#import "appleIpod.h"
#import "appleTV.h"
#import "appleIphone.h"
#import "appleFactory.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    appleIpod *AppleIpod = [[appleIpod alloc] init];
    if (AppleIpod !=nil)
    {
        [AppleIpod printName];
    }
    appleTV *AppleTV = [[appleTV alloc] init];
    if (AppleTV !=nil)
    {
        [AppleTV printName];
    }
    appleIphone *AppleIphone = [[appleIphone alloc] init];
    if (AppleIphone !=nil)
    {
        [AppleIphone printName];
    }
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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
