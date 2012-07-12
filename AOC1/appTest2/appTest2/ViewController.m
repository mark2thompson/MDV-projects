//
//  ViewController.m
//  appTest2
//
//  Created by Mark Thompson on 7/10/12.
//  Copyright (c) 2012 markthompson. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h" 


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
    UILabel *authorName = [[UILabel alloc]initWithFrame:CGRectMake(100.0f, 60.0f, 220.0f, 20.0f)];
    if (authorName != nil)
    {
        authorName.text = @"Walter Isaacson";
        authorName.textAlignment = UITextAlignmentLeft;
        authorName.backgroundColor = [UIColor purpleColor];
        authorName.textColor =[UIColor greenColor];
    };
    UILabel *publishLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 100.0f, 80.0f, 20.0f)];
    if (publishLab != nil)
    {
        publishLab.text = @"Published:";
        publishLab.textAlignment = UITextAlignmentRight;
        publishLab.backgroundColor = [UIColor grayColor];
        publishLab.textColor =[UIColor whiteColor];
    };
    UILabel *publishDate = [[UILabel alloc]initWithFrame:CGRectMake(100.0f, 100.0f, 220.0f, 20.0f)];
    if (publishDate != nil)
    {
        publishDate.text = @"October 24, 2011";
        publishDate.textAlignment = UITextAlignmentLeft;
        publishDate.backgroundColor = [UIColor whiteColor];
        publishDate.textColor =[UIColor blackColor];
    };
    UILabel *summaryLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 130.0f, 80.0f, 20.0f)];
    if (summaryLab != nil)
    {
        summaryLab.text = @"Summary";
        summaryLab.textAlignment = UITextAlignmentLeft;
        summaryLab.backgroundColor = [UIColor blueColor];
        summaryLab.textColor =[UIColor redColor];
    };
    UILabel *summaryText = [[UILabel alloc]initWithFrame:CGRectMake(0, 150.0f, 320.0f, 100.0f)];
        summaryText.numberOfLines = 0;
    if (summaryText != nil)
    {
        summaryText.text = @"This is a book about the life of Steve Jobs. It starts with his early life and reads through his time at Apple, Next, Pixar, and back to Apple.";
        summaryText.textAlignment = UITextAlignmentCenter;
        summaryText.backgroundColor = [UIColor greenColor];
        summaryText.textColor =[UIColor redColor];
    };
    //Create an NSArray of 5 items talked about in the book. These items will be NSStrings. Add the items to the array.
    UILabel *bioLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 300.0f, 100.0f, 20.0f)];
    if (bioLable != nil)
    {
    bioLable.text = @"List of items:";
    bioLable.textAlignment = UITextAlignmentLeft;
    bioLable.backgroundColor = [UIColor yellowColor];
    bioLable.textColor =[UIColor redColor];
    };
    
   
    
    NSArray *sjBioItems = [[NSArray alloc] initWithObjects: @"Apple",
                           @"Macintosh",
                           @"Next", 
                           @"Pixar", 
                           @"Apple TV", nil];
    NSMutableString *sjBioList = [[NSMutableString alloc] init];
    for (int i=0; i<sjBioItems.count; i++){
        NSString *bio = [sjBioItems objectAtIndex:i];
        if (sjBioItems.count == i+1){
            [sjBioList appendString:bio];
        } else {
            [sjBioList appendString:[[NSString alloc] initWithFormat:@"%@, ", bio]];
        }
    };
    UILabel *biolist = [[UILabel alloc] initWithFrame:CGRectMake(0, 320.0f, 320.0f, 30.0f)];
    biolist.text = sjBioList;
    biolist.textAlignment = UITextAlignmentCenter;
    biolist.backgroundColor = [UIColor blueColor];
    biolist.textColor =[UIColor orangeColor];
    
    [self.view addSubview:bookName];
    [self.view addSubview:authorLab];
    [self.view addSubview:authorName];
    [self.view addSubview:publishLab];
    [self.view addSubview:publishDate];
    [self.view addSubview:summaryLab];
    [self.view addSubview:summaryText];
    [self.view addSubview:bioLable];
    [self.view addSubview:biolist];
    

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
