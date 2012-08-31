//
//  appleIphone.m
//  objc2Project1
//
//  Created by Mark Thompson on 8/2/12.
//  Copyright (c) 2012 markthompson. All rights reserved.
//

#import "appleIphone.h"
#import "appleBase.h"

@implementation appleIphone

-(id)init
{
    if (self = [super init])
    {
        [self setAttributes:APPLEPRODUCT_IPHONE name:@"iPhone" amount:1];
    }
    return self;
}

@end
