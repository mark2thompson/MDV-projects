//
//  ViewController.h
//  appTestweek2calc
//
//  Created by Mark Thompson on 9/8/12.
//  Copyright (c) 2012 Mark Thompson. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{ plus } CalcOperation;

@interface ViewController : UIViewController{
    IBOutlet UITextField *display;
    IBOutlet UIButton *cbutton;
    IBOutlet UISegmentedControl *bgSeg;
    NSString *storage;
    CalcOperation operation;
}
// setting up the IBAction's to use in the ViewConroller.m and the xib

- (IBAction) button1;
- (IBAction) button2;
- (IBAction) button3;
- (IBAction) button4;
- (IBAction) button5;
- (IBAction) button6;
- (IBAction) button7;
- (IBAction) button9;
- (IBAction) button0;
- (IBAction) plusbutton;
- (IBAction) equalsbutton;
- (IBAction) clearDisplay;
- (IBAction) backgroundSeg;
- (IBAction)onSwitched:(id)sender;
- (IBAction)onClick:(id)sender;
@end
