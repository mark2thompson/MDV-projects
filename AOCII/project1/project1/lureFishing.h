//
//  lureFishing.h
//  project1
//
//  Created by Mark Thompson on 10/25/12.
//  Copyright (c) 2012 Mark Thompson. All rights reserved.
//

#import "baseFishing.h"

@interface lureFishing : baseFishing
{
    int lure;
}

typedef enum {
    SPOON,
    SPRITE,
    PLUG
}lure;

@property int lureType;
@property NSString *lureName;
@property int speedToReel;

@end
