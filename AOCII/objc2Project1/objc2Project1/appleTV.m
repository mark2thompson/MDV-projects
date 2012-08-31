//
//  appleTV.m
//  objc2Project1
//
//  Created by Mark Thompson on 8/2/12.
//  Copyright (c) 2012 markthompson. All rights reserved.
//

#import "appleTV.h"
#import "appleBase.h"

@implementation appleTV

-(id)init
{
    if (self = [super init])
    {
        [self setAttributes:APPLEPRODUCT_TV name:@"Apple TV" amount:2];
    }
    return self;
}

@end
