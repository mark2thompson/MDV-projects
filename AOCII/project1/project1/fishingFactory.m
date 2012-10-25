//
//  fishingFactory.m
//  project1
//
//  Created by Mark Thompson on 10/25/12.
//  Copyright (c) 2012 Mark Thompson. All rights reserved.
//

#import "fishingFactory.h"

@implementation fishingFactory

+(baseFishing *)createFishingTrip: (int)fishingType
{
    // if bait fishing is requested make a bait rig
    if (fishingType == BAIT){
        return [[baitFishing alloc] init];
    } else if (fishingType == LURE){
        return [[lureFishing alloc] init];
    } else if (fishingType == JIG){
        return [[jigFishing alloc] init];
    }
    else return nil;
}


@end
