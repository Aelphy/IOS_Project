//
//  RSS.m
//  Project_1
//
//  Created by Mac User on 10/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RSS.h"
#import "XMLParser.h"

@implementation RSS

//@synthesize delegate;
@synthesize channel;
@synthesize resultsData;
/*
- (id) init
{
    if (self = [super init])
    {
        //delegate = nil;
    }
    return self;
}*/


+ (RSS*) instance
{
	static RSS* sharedRSSInstance = nil;
	static dispatch_once_t predicate ;
	dispatch_once (&predicate, ^
				   {
					   sharedRSSInstance = [[RSS alloc] init ];
				   });
	return sharedRSSInstance;
}

- (void) LoadFromURL: ( NSString* )url
{
	[self parsit:url];
	[channel release];
	//return channel.RSSItems;
}

-(RSSChannel*)parsit:(NSString*)url
{
    /*NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:5.0];
	NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector (VosvratChanela:) name:@"connection_finish" object:nil];
	resultsData=[[NSMutableData alloc] init];
	[[NSNotificationCenter defaultCenter] addObserver: selector:@selector (VosvratChanela:) name:@"connection_finish" object:nil];
	[connection start];*/

	//RSSChannel* channell = nil;
    //NSData* resultsData = nil;
	XMLParser* parsDelegate = [XMLParser new];
    NSXMLParser* parser = [[NSXMLParser alloc] initWithContentsOfURL:[NSURL URLWithString:url] ];
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
	//[xml release];
	//xml=nil;
	
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

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	NSLog(@"Received Response");
	[resultsData	setLength:0];
	if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
		NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
		int status = [httpResponse statusCode];
		
		if (!((status >= 200) && (status < 300))) {
			NSLog(@"Connection failed with status %d", status);
			[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
		}
	}
	
}


- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	//NSData* resultsData=data;
	//NSMutableData* resultsData;
	[resultsData appendData:data];
	NSString *resultsString = [[NSString alloc] initWithData:resultsData encoding:NSUTF8StringEncoding];
	//NSLog(@"received data %@ %i",resultsString,[resultsString length]);
	
	
	if ([resultsString isEqualToString: @"FAIL"]){
		NSLog(@"failed to retrieve data");
	}//else{
		//resultsObjects = [[resultsString componentsSeparatedByString:@":"] mutableCopy];
		
		//if([resultsObjects objectAtIndex:0]==@"usernamecheck"){
		//	if ([resultsObjects objectAtIndex:1]==username.text) {
		//		if ([resultsObjects objectAtIndex:2]==@"NG"){
		//			//set the check marker to bad
		//			[usernameVer setImage:[UIImage imageNamed:@"redcross.png"]];
		//		}else{
		//			//set the check market to good
		//			[usernameVer setImage:[UIImage imageNamed:@"greentick.png"]];
		//		}
		//	}
			
		//}
	//}
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	
	NSLog(@"Connection failed: %@", [error description]);
	//UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Unable to retrieve data" message:[NSString stringWithFormat:@"Error code %i",[error code]] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	
}
- (void) connectionDidFinishLoading:(NSURLConnection *)connection
{
	NSString *resultsString = [[NSString alloc] initWithData:resultsData encoding:NSUTF8StringEncoding];
	//NSLog(@"%@",resultsString);
	[[NSNotificationCenter defaultCenter] postNotificationName:@"connection_finish" object:self];

	
}

- (void) VosvratChanela:(id)params
{
	XMLParser* parsDelegate = [XMLParser new];
    NSXMLParser* parser = [[NSXMLParser alloc] initWithData:resultsData];
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
	//return channel;
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}


@end

