//
//  baseFishing.m
//  project1
//
//  Created by Mark Thompson on 10/25/12.
//  Copyright (c) 2012 Mark Thompson. All rights reserved.
//

#import "baseFishing.h"

@implementation baseFishing

//synthesize - following along with video - creates get and set methods for each property 
@synthesize itemsNeeded, instructions, fishingTimeMinutes;

//initialize the base Fishing, creating the intance and setting fishing time to zero

-(id)init
{
    self = [super init];
    if (self !=nil)
    {
        [self setFishingTimeMinutes:0];
        [self setItemsNeeded:nil];
        [self setInstructions:nil];
    }
    return self;
}

// calculation/manipulation method to find fishing time
-(void)calculateFishingTime
{
    //nothing written yet
    NSLog(@"When Fishing with this type you need to sit for %i minutes", fishingTimeMinutes);
}

@end
