//
//  ViewController.h
//  appTest4
//
//  Created by Mark Thompson on 7/26/12.
//  Copyright (c) 2012 markthompson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    UITextField *userField;
    UILabel *unDialog;
    UILabel *blankLabel;
}

-(void)onClick:(UIButton*)loginButton;
@end
