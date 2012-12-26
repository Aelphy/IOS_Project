//
//  RSS.h
//  Project_1
//
//  Created by Mac User on 10/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSSClient.h"
#import "RSSChannel.h"
#import "RSSItem.h"
#import "RSSDelegate.h"

@protocol RSSDelegate;
@interface RSS : NSObject

@property (retain) id target;
@property (assign) SEL callback;
@property (assign) id<RSSDelegate> delegate;

- (void) LoadFromURL: ( NSString* )url;  
              
@end
