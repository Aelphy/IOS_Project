//
//  RSSItemViewController.m
//  Project_1
//
//  Created by Admin on 12/12/12.
//
//

#import "RSSItemViewController.h"

@interface RSSItemViewController ()

@end

@implementation RSSItemViewController

@synthesize item;
@synthesize LT;
@synthesize LL;
@synthesize Text;
@synthesize Text1;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	LT.text=item.title;
	LL.text=item.link;
	//NSString* HTML = [NSString stringWithFormat:@"<html><head><meta name=\"viewport\" content=\"width=device-width, user-scalable=no\"/><style>*{margin:0px;padding:0px}</style>
					 // </head><body style=\" background-color:transparent\"><div style=\"text-align: %@\">%@</div></body></html>",adAlignment,link];
	//HTML =
	Text.Text = item.RSSDescription ;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
