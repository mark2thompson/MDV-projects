//
//  baseFishing.h
//  project1
//
//  Created by Mark Thompson on 10/25/12.
//  Copyright (c) 2012 Mark Thompson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface baseFishing : NSObject
{
    int fishingEnum;
}

typedef enum {
    BAIT,
    LURE,
    JIG
} fishingEnum;

// data members for reel time in minutes, instructions, and array of items needed for each fishing types 
@property NSArray *itemsNeeded;
@property NSString *instructions;
@property int fishingTimeMinutes;

//initialize
-(id)init;

// calculation/manipulation method to find fishing time
-(void)calculateFishingTime;
@end
