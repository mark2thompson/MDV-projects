//
//  ViewController.m
//  appTestweek2calc
//
//  Created by Mark Thompson on 9/8/12.
//  Copyright (c) 2012 Mark Thompson. All rights reserved.
//  http://deepakkeswani.com/2012/02/writing-calculator-for-iphone-ios-in-xcode/ helped with calc part

#import "ViewController.h"
#import "infoViewController.h"
@interface ViewController ()

@end

@implementation ViewController

-(IBAction)clearDisplay
{
    display.text = @"";
}
- (IBAction) button1 {
    display.text=[NSString stringWithFormat:@"%@1",display.text];
}
- (IBAction) button2 {
    display.text=[NSString stringWithFormat:@"%@2",display.text];
}
- (IBAction) button3 {
    display.text=[NSString stringWithFormat:@"%@3",display.text];
}
- (IBAction) button4 {
    display.text=[NSString stringWithFormat:@"%@4",display.text];
}
- (IBAction) button5 {
    display.text=[NSString stringWithFormat:@"%@5",display.text];
}
- (IBAction) button6 {
    display.text=[NSString stringWithFormat:@"%@6",display.text];
}
- (IBAction) button7 {
    display.text=[NSString stringWithFormat:@"%@7",display.text];
}
- (IBAction) button8 {
    display.text=[NSString stringWithFormat:@"%@8",display.text];
}
- (IBAction) button9 {
    display.text=[NSString stringWithFormat:@"%@9",display.text];
}
- (IBAction) button0 {
    display.text=[NSString stringWithFormat:@"%@0",display.text];
}
- (IBAction) equalsbutton {
    NSString *sum = display.text;
    switch(operation){
        case Plus:
            display.text = [NSString stringWithFormat:@"%qi",[sum longLongValue]+[storage longLongValue]];
            break;
    }
}
- (IBAction) plusbutton {
    operation = Plus;
    storage = display.text;
    display.text = @"";
}

- (IBAction)backgroundSeg
{
	if(bgSeg.selectedSegmentIndex == 0){
        self.view.backgroundColor = [UIColor greenColor];
	}
	if(bgSeg.selectedSegmentIndex == 1){
        self.view.backgroundColor = [UIColor blueColor];
	}
    if(bgSeg.selectedSegmentIndex == 2){
        self.view.backgroundColor = [UIColor whiteColor];
    }
}
- (IBAction)onSwitched:(id)sender
{
    
}
- (IBAction)onClick:(id)sender
{
    infoViewController *viewController =
    [[infoViewController alloc]
        initWithNibName:@"infoView" bundle:nil];
    if (viewController !=nil)
    {
        [self presentModalViewController:viewController animated:TRUE];
    }
    
}

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


@end
