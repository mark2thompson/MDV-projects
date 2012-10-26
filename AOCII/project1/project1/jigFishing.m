//
//  jigFishing.m
//  project1
//
//  Created by Mark Thompson on 10/25/12.
//  Copyright (c) 2012 Mark Thompson. All rights reserved.
//

#import "jigFishing.h"

@implementation jigFishing

@synthesize jigSize, timePerJigSize;

// customizing init to set unique data members
-(id)init
{
    self = [super init];
    if (self != nil)
    {
        [self setFishingTimeMinutes:10];
        [self setJigSize:0];
        [self setTimePerJigSize:20];
    }
    return self;
    
};

//overriding the base fishing time to factor in unique data members
-(void)calculateFishingTime
{
    [self setFishingTimeMinutes:(jigSize * timePerJigSize)];
    NSLog(@"This type of fishing requires at least %i minutes.", self.fishingTimeMinutes);
}

@end


