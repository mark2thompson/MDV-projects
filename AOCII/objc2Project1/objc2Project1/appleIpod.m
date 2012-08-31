//
//  appleIpod.m
//  objc2Project1
//
//  Created by Mark Thompson on 8/2/12.
//  Copyright (c) 2012 markthompson. All rights reserved.
//

#import "appleIpod.h"
#import "appleBase.h"

@implementation appleIpod

-(id)init
{
    if (self = [super init])
    {
        [self setAttributes:APPLEPRODUCT_IPOD name:@"iPod" amount:4];
    }
    return self;
}

@end
