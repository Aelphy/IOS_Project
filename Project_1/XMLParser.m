//
//  XMLParser.m
//  Project_1
//
//  Created by Mac User on 10/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "XMLParser.h"

@implementation XMLParser
@synthesize done            = m_done;
@synthesize titles          = m_titles;
@synthesize links           = m_links;
@synthesize Descriptions    = m_Descriptions;
@synthesize error           = m_error;
@synthesize channel;



-(void) dealloc {
    [m_error release];
    [m_titles release];
    [m_links release];
    [m_Descriptions release];
    [channel release];
    [super dealloc];
}

// start
- (void)parserDidStartDocument:(NSXMLParser *)parser {
    NSLog(@"parser works");
	m_done              = NO;
    m_titles            = [NSMutableArray new];
    m_links             = [NSMutableArray new];
    m_Descriptions      = [NSMutableArray new];
    channel             = [[[RSSChannel alloc] init]autorelease] ;

}

// parsing complete
- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    m_done              = YES;
    NSLog(@"VIKTORY penis");
}

// error
-(void) parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    m_done              = YES;
    m_error             = [parseError retain];
	NSLog(@"PARS ERROR");
}

//validationerror
-(void) parser:(NSXMLParser *)parser validationErrorOccurred:(NSError *)validationError {
    m_done              = YES;
    m_error             = [validationError retain];
	NSLog(@"validationerror");
}

//new element
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{ 
    NSLog(@"%@ STAT", elementName);
	BOOL	isTitle2           = [[elementName lowercaseString] isEqualToString:@"title"];
	BOOL    isLink2            = [[elementName lowercaseString] isEqualToString:@"link"];
	BOOL	isDescription2     = [[elementName lowercaseString] isEqualToString:@"description"];
	BOOL	isItem2            = [[elementName lowercaseString] isEqualToString:@"item"];

        
    if (isTitle2){
		m_title              = [NSMutableString new];
		isTitle	=	isTitle2;
    }
    else if (isLink2){
        m_link              = [NSMutableString new];
		isLink = isLink2;
    }
    else if (isDescription2){
        m_Description       = [NSMutableString new];
		isDescription = isDescription2;
    }
    else if (isItem2){
        item                = [[[RSSItem alloc] init] autorelease] ;
		isItem = isItem2;
    }
    else{
        isunone=YES;
        NSLog(@"unnone!!!! starte %@", elementName);
    }
}


//end of element
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    

    NSLog(@"%@ END",elementName);
    if ( isTitle ) {
        if(isItem){
            item.title = m_title;
            NSLog(@"FATALITY");
        }
        else{
            channel.title = m_title;
        }
		if (m_title!=nil)
		{
			[m_title release];
			m_title=nil;
			
		}
		else
		{
			NSLog(@"pisko_title");
		}
		isTitle = NO;
    }
    else if (isLink){
        if(isItem){
            item.link = m_link;
            NSLog(@"FATALITY");
        }
        else{
            channel.link = m_link;
        }
		if(m_link!=nil)
		{
			[m_link release];
			
		}
		else
		{
			NSLog(@"pisko_link");
		}
		isLink = NO;
    }
    else if(isDescription){
        if(isItem){
            item.RSSDescription = m_Description;
            NSLog(@"FATALITY");
        }
        else{
            channel.RSSDescription = m_Description;
        } 
		if(m_Description != nil)
		{
			[m_Description release];
			m_Description = nil;
		}else
		{
			NSLog(@"pisko_desc");
		}
		isDescription = NO;
    }
    else{
        NSLog(@"unnone!!!! ende %@", elementName);
        isunone=NO;
    }
    
    BOOL isItem2            = [[elementName lowercaseString] isEqualToString:@"item"];
    if (isItem2) {
        [channel.RSSItems addObject:item];
        [item release];
		isItem = NO;
    }
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {

    NSLog(@"%@ ", string);
	if ( isTitle ) {
        [m_title appendString:string];
    }
    else if (isLink){
        [m_link appendString:string];
    }
    else if (isDescription){
        [m_Description appendString:string];
    }
}

@end
