//
//  XMLParser.h
//  Project_1
//
//  Created by Mac User on 10/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSSChannel.h"
#import "RSSItem.h"

@interface XMLParser : NSObject<NSXMLParserDelegate>
{
    BOOL m_done;
    BOOL isTitle;
    BOOL isLink;
    BOOL isDescription;
    NSError* m_error;
    NSMutableArray* m_titles;
    NSMutableArray* m_links;
    NSMutableArray* m_Descriptions;
    NSMutableString* m_title;
    NSMutableString* m_link;
    NSMutableString* m_Description;
    RSSItem* item;
    BOOL isunone;
	BOOL isItem;
}

@property (readonly) BOOL done;
@property (readonly) NSError* error;
@property (readonly) NSArray* titles;
@property (readonly) NSArray* links;
@property (readonly) NSArray* Descriptions;
@property (retain) RSSChannel* channel;

@end
