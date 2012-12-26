//
//  RSSChannel.m
//  Project_1
//
//  Created by Mac User on 10/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RSSChannel.h"

@implementation RSSChannel
{
    
}   
@synthesize title;
@synthesize link;
@synthesize docs;
@synthesize RSSDescription;
@synthesize language;
@synthesize managingEditor;
@synthesize webMaster;
@synthesize copyright;
@synthesize generator;
@synthesize RSSItems;
@synthesize pubDate;

-(id) init 
{ 
    if (self = [super init]) 
    {
        title           = nil;
        link            = nil;
        docs            = nil;
        RSSDescription  = nil;
        language        = nil;
        managingEditor  = nil;
        webMaster       = nil;
        copyright       = nil;
        generator       = nil;
        RSSItems        = nil;
        pubDate         = nil;
    }
    return self;    
}

- (void) dealloc 
{
    [title release];
    [link release];
    [docs release];
    [RSSDescription release];
    [language release];
    [managingEditor release];
    [webMaster release];
    [copyright release];
    [generator release];
    [RSSItems release];
    [pubDate release];
    [super dealloc];
}

@end
