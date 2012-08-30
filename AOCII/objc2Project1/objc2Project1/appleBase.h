//
//  appleBase.h
//  objc2Project1
//
//  Created by Mark Thompson on 8/2/12.
//  Copyright (c) 2012 markthompson. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    APPLEPRODUCT_TV=0,
    APPLEPRODUCT_IPOD,
    APPLEPRODUCT_IPHONE
}   AAppleProduct;

@interface appleBase : NSObject
{
    AAppleProduct appleProduct;
}
@end
