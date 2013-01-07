//
//  RSSClient.m
//  Project_1
//
//  Created by Mac User on 10/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
/*
#import "RSSClient.h"
#import "RSS.h"
#import "XMLParser.h"


@implementation RSSClient

-(void)dealloc
{
	[super dealloc];
}

-(RSSChannel*)parsit:(NSString*)url
{
    NSURL* RSSurl=[NSURL URLWithString:url];
	RSSChannel* channel = nil;
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"rss" ofType:@"xml"];
	NSData* xml = [[NSData alloc] initWithContentsOfFile: path];
	
	XMLParser* parsDelegate = [XMLParser new];
    NSXMLParser* parser = [[NSXMLParser alloc] initWithData:xml];
    [parser setDelegate:parsDelegate];
    [parser parse];
	if (parsDelegate.done)
	{
		NSLog(@"complete");
	
		if(parsDelegate.error ==nil)
		{
			[self didRSSLoadSucceeded];
			channel    = [parsDelegate.channel retain];
		}
		else
		{
			[self didRSSLoadFaild:parsDelegate.error];
        
		}

	}
	else
	{
		NSLog(@"ne robit");
	}
	[parsDelegate release];
	parsDelegate=nil;
	[parser release];
	parser=nil;
	[xml release];
	xml=nil;
	
	return channel;
}

-(void)didRSSLoadSucceeded
{
    NSLog(@"Oh Yes");
}
-(void)didRSSLoadFaild: (NSError* ) error
{
    NSLog(@"ALERT!! error %@",error);    
}

@end
 */
 