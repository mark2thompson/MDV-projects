//
//  appleBase.m
//  objc2Project1
//
//  Created by Mark Thompson on 8/2/12.
//  Copyright (c) 2012 markthompson. All rights reserved.
//

#import "appleBase.h"

@implementation appleBase

-(void)setAttributes: (AAppleProduct)product name:(NSString*)name amount:(int)amount
{
    howManyIown = amount;
    productName = name;
    appleProduct = product;
}

-(void)printName;
{
    NSLog(@"Name=%@" , productName);
}
@end
