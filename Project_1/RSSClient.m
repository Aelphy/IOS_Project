//
//  RSSClient.m
//  Project_1
//
//  Created by Mac User on 10/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RSSClient.h"
#import "RSS.h"
#import "XMLParser.h"


@implementation RSSClient

@synthesize channel;

-(id) init
{
    self = [ super init ];
    
    if ( nil != self )
    {
        
    }
    
    return self;
}

-(NSError*)parsit:(NSString*)url
{
    NSURL* RSSurl=[NSURL URLWithString:url];
	RSSurl = nil;
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"rss" ofType:@"xml"];
	NSData* xml = [[NSData alloc] initWithContentsOfFile: path];
	
	XMLParser* parsDelegate = [XMLParser new];
    NSXMLParser* parser = [[NSXMLParser alloc] initWithData:xml];
    [parser setDelegate:parsDelegate];
    [parser parse];
   /* while (!parsDelegate.done) {
        sleep(1);
    }*/if (parsDelegate.done)
	{
		NSLog(@"complete");
	
    if(parsDelegate.error ==nil)
    {
        
        [self didRSSLoadSucceeded];
        self.channel    = parsDelegate.channel;
    }
    else
    {
        [self didRSSLoadFaild:parsDelegate.error];
        
    }
    [parsDelegate release];
    [parser release]; 
    return parsDelegate.error;
	}
	else
	{
		NSLog(@"ne robit");
		return nil;
	}
}

-(void)didRSSLoadSucceeded {
    NSLog(@"Oh Yes");
}
-(void)didRSSLoadFaild: (NSError* ) error{
    NSLog(@"ALERT!! error %@",error);    
}

@end
 