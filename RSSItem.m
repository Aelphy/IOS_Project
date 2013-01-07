//
//  RSSItem.m
//  Project_1
//
//  Created by Mac User on 10/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RSSItem.h"

@implementation RSSItem

@synthesize title;
@synthesize guid;
@synthesize link;
@synthesize RSSDescription;

-(id) init
{ 
    if (self = [super init])
    {
        title=nil;
        link=nil;
        guid=nil;
        RSSDescription=nil;

    }
    return self;    
}

- (void) dealloc
{
    [title release];
    [link release];
    [guid release];
    [RSSDescription release];
    [super dealloc];
}

@end

