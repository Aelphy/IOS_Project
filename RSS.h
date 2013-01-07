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


@interface RSS : NSObject<NSURLConnectionDataDelegate>
{

}
@property (retain) RSSChannel* channel;
@property (assign) id<RSSDelegate> delegate;
@property NSMutableData* resultsData;

- (void) LoadFromURL: ( NSString* )url;
+ (RSS*) instance;
- (void) VosvratChanela:(id)params;
              
@end
