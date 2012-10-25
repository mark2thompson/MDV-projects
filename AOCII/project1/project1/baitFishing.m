//
//  baitFishing.m
//  project1
//
//  Created by Mark Thompson on 10/25/12.
//  Copyright (c) 2012 Mark Thompson. All rights reserved.
//

#import "baitFishing.h"

@implementation baitFishing

@synthesize size, timePerSize;

// customizing init to set unique data members
-(id)init
{
    self = [super init];
    if (self != nil)
    {
        [self setFishingTimeMinutes:20];
        [self setSize:0];
        [self setTimePerSize:45];
    }
    return self;
        
};

//overriding the base fishing time to factor in unique data members
-(void)calculateFishingTime
{
    [self setFishingTimeMinutes:(size * timePerSize)];
    NSLog(@"This type of fishing requires at least %i minutes.", self.fishingTimeMinutes);
}

@end
