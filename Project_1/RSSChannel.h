//
//  RSSChannel.h
//  Project_1
//
//  Created by Mac User on 10/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSSItem.h"

@interface RSSChannel : NSObject
{

}

@property (copy) NSString* title;
@property (retain) NSString* link;
@property (copy) NSString* docs;
@property (copy) NSString* RSSDescription;
@property (copy) NSString* language;
@property (copy) NSString* managingEditor;
@property (copy) NSString* webMaster;
@property (copy) NSString* copyright;
@property (retain) NSString* generator;
@property (retain) NSMutableArray* RSSItems;
@property (retain) NSData* pubDate;


@end
