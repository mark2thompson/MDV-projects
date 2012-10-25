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
    return [[baitFishing alloc] init];
}


@end
