//
//  RSSViewController.m
//  Project_1
//
//  Created by Admin on 11/28/12.
//
//

#import "RSSViewController.h"

@interface RSSViewController ()

@end

@implementation RSSViewController

@synthesize TV;
@synthesize rss;


/*-(void)setItems:(NSMutableArray*)i
{
	self.items=[i copy];
}*/
- (void) dealloc
{
    [items release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

		/*for (int i=0;i<10;i++)
		{
			NSLog
		}*/
    }
    return self;
}

- (void)viewDidLoad
{   
    [super viewDidLoad];
	rss=[RSS instance];
	//rss = [[RSS alloc]init];
 	[rss LoadFromURL:@"http://itw66.ru/rss/index"];
	
	items = [rss.channel.RSSItems retain];
	NSLog(@"%@",items);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	int index = indexPath.row % items.count;
	//NSLog(@" %u____ %d ",items.count, index);
	RSSItem* item = items[index];
	NSString* cellID = item.title;//@"cellID";
	UITableViewCell* cell;
	cell = [tableView dequeueReusableCellWithIdentifier:cellID];
	if(!cell)
	{
		cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID]autorelease];
	}
	cell.textLabel.text=item.title;
	cell.detailTextLabel.text=item.RSSDescription;
	//cell set
	[cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
	return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	//RSSItem* showitem = items[indexPath.row];
	RSSItemViewController* itemViewController = [[[RSSItemViewController alloc]initWithNibName:@"RSSItemViewController" bundle:nil]autorelease];
	itemViewController.item = items[indexPath.row];
	[self.navigationController pushViewController:itemViewController animated:YES];
}
-(int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return items.count;
}
-(int) numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}
@end
