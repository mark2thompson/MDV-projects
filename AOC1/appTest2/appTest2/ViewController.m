//
//  ViewController.m
//  appTest2
//
//  Created by Mark Thompson on 7/10/12.
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
    self.view.backgroundColor = [UIColor redColor];
    UILabel *bookName = [[UILabel alloc]initWithFrame:CGRectMake(0, 10.0f, 320.0f, 20.0f)];
    if (bookName != nil)
    {
        bookName.text = @"Steve Jobs Biography";
        bookName.textAlignment = UITextAlignmentCenter;
        bookName.backgroundColor = [UIColor blueColor];
        bookName.textColor =[UIColor orangeColor];
    };
    UILabel *authorLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 60.0f, 80.0f, 20.0f)];
    if (authorLab != nil)
    {
        authorLab.text = @"Author:";
        authorLab.textAlignment = UITextAlignmentRight;
        authorLab.backgroundColor = [UIColor yellowColor];
        authorLab.textColor =[UIColor redColor];
    };
    UILabel *authorName = [[UILabel alloc]initWithFrame:CGRectMake(100, 60.0f, 220.0f, 20.0f)];
    if (authorName != nil)
    {
        authorName.text = @"Walter Isaacson";
        authorName.textAlignment = UITextAlignmentLeft;
        authorName.backgroundColor = [UIColor purpleColor];
        authorName.textColor =[UIColor greenColor];
    };
    [self.view addSubview:bookName];
    [self.view addSubview:authorLab];
    [self.view addSubview:authorName];

    

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
