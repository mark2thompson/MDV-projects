//
//  lureFishing.m
//  project1
//
//  Created by Mark Thompson on 10/25/12.
//  Copyright (c) 2012 Mark Thompson. All rights reserved.
//

#import "lureFishing.h"

@implementation lureFishing
@synthesize lureType, lureName, speedToReel;

// customize the init for lure fishing
-(id)init
{
    self = [super init];
    if (self != nil)
    {
        //setting data members to defaults
        [self setFishingTimeMinutes:0];
        [self setLureType:SPOON];
        [self setLureName:@""];
        NSLog(@"You are fishing with a lure!");
    }
    return self;
};

// overwriting the calculation method
-(void)calculateFishingTime
{
    // check the length of the lure
    NSLog(@"%@ has %i length", lureName, [lureName length]);
    
    // set the fishing time
    if (lureType == SPOON){
        [self setFishingTimeMinutes:35];
        [self setSpeedToReel:(self.fishingTimeMinutes + ([lureName length] * .2))];
    }
    if (lureType == SPRITE){
        [self setFishingTimeMinutes:20];
        [self setSpeedToReel:(self.fishingTimeMinutes + ([lureName length] * .2))];
    }
    if (lureType == PLUG){
        [self setFishingTimeMinutes:10];
        [self setSpeedToReel:(self.fishingTimeMinutes + ([lureName length] * .2))];
    }else
    {
        NSLog(@"You need to specify a valid lure.");
    }
    
    // log out total fishing time
    NSLog(@"This type of fishing requires at least %i minutes to reel.", self.speedToReel);

    
}

@end
