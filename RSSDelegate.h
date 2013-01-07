//
//  RSSDelegate.h
//  Project_1
//
//  Created by Mac User on 10/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "RSSChannel.h"

@protocol RSSDelegate <NSObject>

-(void) didRSSLoadSucceeded;
-(void) didRSSLoadFaild: (NSError* ) error;
-(RSSChannel*)parsit:(NSString*)url;

@end
