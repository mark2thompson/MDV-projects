//
//  ViewController.m
//  project1
//
//  Created by Mark Thompson on 10/25/12.
//  Copyright (c) 2012 Mark Thompson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    //create a bait fishing rig and set bait size
    baitFishing *baitFishingRig = (baitFishing*)[fishingFactory
                                                 createFishingTrip:BAIT];
    [baitFishingRig setSize:2];
    
    if (baitFishingRig !=nil){
        
        NSArray *baitRigItems = [[NSArray alloc]
            initWithObjects:@"Hook", @"Shrimp", nil];
        [baitFishingRig setItemsNeeded:baitRigItems];
        
        NSString *baitRigInstructions = @"Hook Shrimp through the tail and cast to desired location.";
        [baitFishingRig setInstructions:baitRigInstructions];
        
        NSLog(@"You are now fishing with a bait rig! "
              "with the items %@", [baitFishingRig itemsNeeded]);
        NSLog(@"%@", baitFishingRig.instructions);
        
        // calculate fishing time
        [baitFishingRig calculateFishingTime];
    }
    
    // create a lure fishing rig and set lure type and name
    lureFishing *lureFishingRig = (lureFishing*)[fishingFactory createFishingTrip:1];
    
    if (lureFishingRig != nil){
        [lureFishingRig setLureName:@"Spoon"];
        [lureFishingRig setLureType:SPOON];
        [lureFishingRig setInstructions:@""];
        
        // calculate and log the fishing time
        [lureFishingRig calculateFishingTime];
        int myFishingTime = lureFishingRig.fishingTimeMinutes;
        
        NSLog(@"%i", myFishingTime);
        
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
