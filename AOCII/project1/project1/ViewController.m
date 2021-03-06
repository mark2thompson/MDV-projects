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
    
    // create UILabel for bait fishing
    baitFishingItemsLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320.0f, 90.0f)];
    baitFishingItemsLabel.text = [NSString stringWithFormat:@"You are now fishing with a bait rig "
                             "with a %@", [baitFishingRig itemsNeeded]];
    baitFishingItemsLabel.numberOfLines = 3;
    
    baitfishingInstructLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 90.0f, 320.0f, 60.0f)];
    baitfishingInstructLabel.text = [NSString stringWithFormat:@"%@", [baitFishingRig instructions]];
    baitfishingInstructLabel.numberOfLines = 3;
    
    [self.view addSubview:baitFishingItemsLabel];
    [self.view addSubview:baitfishingInstructLabel];
    
    // create a lure fishing rig and set lure type and name
    lureFishing *lureFishingRig = (lureFishing*)[fishingFactory createFishingTrip:LURE];
    
    if (lureFishingRig != nil){
        [lureFishingRig setLureName:@"Spoon"];
        [lureFishingRig setLureType:SPOON];
        [lureFishingRig setInstructions:@""];
        
        // calculate and log the fishing time
        [lureFishingRig calculateFishingTime];
        int myFishingTime = lureFishingRig.fishingTimeMinutes;
        
        NSLog(@"%i", myFishingTime);
        
    }
    
    //create UILabel for lure fishing
    lureFishingNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 150.0f, 320.0f, 60.0f)];
    lureFishingNameLabel.text = [NSString stringWithFormat:@"You are now fishing with a %@ that is a size %u",lureFishingRig.lureName, lureFishingRig.lureName.length ];
    lureFishingNameLabel.numberOfLines = 3;
    
    lureFishingSpeedLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 210.0f, 320.0f, 60.0f)];
    lureFishingSpeedLabel.text = [NSString stringWithFormat:@"This type of fishing requires at least %i seconds to reel.", lureFishingRig.speedToReel];
    lureFishingSpeedLabel.numberOfLines = 3;
    
    [self.view addSubview:lureFishingNameLabel];
    [self.view addSubview:lureFishingSpeedLabel];
    
    
    
    // creat a jig fishing rig and set Jig size
    jigFishing *jigFishingRig = (jigFishing*)[fishingFactory
                                              createFishingTrip:JIG];
    [jigFishingRig setJigSize:4];
    
    if (jigFishingRig != nil){
        NSArray *jigRigItems = [[NSArray alloc]
                                initWithObjects:@"Jig",@"Bait", nil];
        [jigFishingRig setItemsNeeded:jigRigItems];
        
        NSString *jigRigInstructions = @"Hook bait onto Jig and tie through line, cast to desired location and real and tug.";
        [jigFishingRig setInstructions:jigRigInstructions];
        
        NSLog(@"You are now fishing with a Jig Rig! with items %@", [jigFishingRig itemsNeeded]);
        NSLog(@"%@", jigFishingRig.instructions);
        
        // Calculate fishing time
        [jigFishingRig calculateFishingTime];
    }
    // create UILabel for Jig fishing
    jigFishingItemsLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 270.0f, 320.0f, 90.0f)];
    jigFishingItemsLabel.text = [NSString stringWithFormat:@"You are now fishing with a jig rig "
                                  "with a %@", [jigFishingRig itemsNeeded]];
    jigFishingItemsLabel.numberOfLines = 3;
    
    jigfishingInstructLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 330.0f, 320.0f, 60.0f)];
    jigfishingInstructLabel.text = [NSString stringWithFormat:@"%@", [jigFishingRig instructions]];
    jigfishingInstructLabel.numberOfLines = 3;
    
    [self.view addSubview:jigFishingItemsLabel];
    [self.view addSubview:jigfishingInstructLabel];
    
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
