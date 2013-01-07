//
//  RSSItemViewController.h
//  Project_1
//
//  Created by Admin on 12/12/12.
//
//

#import <UIKit/UIKit.h>
#import "RSSItem.h"

@interface RSSItemViewController : UIViewController
@property (nonatomic, retain) IBOutlet UILabel* LT;
@property (nonatomic, retain) IBOutlet UIWebView* Text1;
@property (nonatomic, retain) IBOutlet UILabel* LL;
@property (nonatomic, retain) IBOutlet UITextView* Text;
@property (retain) RSSItem* item ;
@end
