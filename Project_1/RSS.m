//
//  RSS.m
//  Project_1
//
//  Created by Mac User on 10/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RSS.h"

@implementation RSS
{
    
}
@synthesize target;
@synthesize callback;
@synthesize delegate;

- (void) dealloc
{
    [target release];
    [super dealloc];
}

- (RSS*) init
{
    if (self = [super init])
    {
        delegate = nil;
    }
    return self;
}


- (void) LoadFromURL: ( NSString* )url
{
    if (delegate != nil)
    {
        [delegate parsit:url];
    }
    else
    {
        NSLog(@"delegate not defined");
    }
}

@end

