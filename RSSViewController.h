//
//  RSSViewController.h
//  Project_1
//
//  Created by Admin on 11/28/12.
//
//

#import <UIKit/UIKit.h>
#import "RSS.h"
#import "RSSItemViewController.h"
@interface RSSViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
	NSMutableArray* items;
}
@property (nonatomic, retain) IBOutlet UITableView* TV;
@property (retain) RSS* rss;
//-(void) setItems:(NSMutableArray*)i;

@end
