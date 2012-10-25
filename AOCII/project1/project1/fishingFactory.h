//
//  fishingFactory.h
//  project1
//
//  Created by Mark Thompson on 10/25/12.
//  Copyright (c) 2012 Mark Thompson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "baseFishing.h"
#import "baitFishing.h"
#import "lureFishing.h"
#import "jigFishing.h"

@interface fishingFactory : NSObject

+(baseFishing *)createFishingTrip: (int)fishingType;

@end
