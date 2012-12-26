//
//  RSSItem.h
//  Project_1
//
//  Created by Mac User on 10/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSSItem : NSObject
{

}
@property (copy) NSString* title;
@property (copy) NSString* guid;
@property (retain) NSString* link;
@property (copy) NSString* RSSDescription;

@end
