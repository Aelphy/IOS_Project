//
//  RSSClient.h
//  Project_1
//
//  Created by Mac User on 10/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSSDelegate.h"
#import "RSSChannel.h"

@interface RSSClient : NSObject<RSSDelegate>

@property (retain) RSSChannel* channel;

//-(void)run;
//-(void)parsit:(NSURL*) url;
//-(void)didRSSLoadSucceeded;
//-(void)didRSSLoadFaild: (NSError* ) error;
@end
