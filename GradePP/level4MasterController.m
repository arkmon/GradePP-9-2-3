//
//  level4MasterController.m
//  GradePP
//
//  Created by Damir Okic on 17/05/2013.
//  Copyright (c) 2013 OkicDowejko. All rights reserved.
//

#import "level4MasterController.h"
#import "AppDelegate.h"
#import "level4DetailController.h"

@interface level4MasterController ()
@property(nonatomic, retain) NSMutableArray *moduleListCollection;

@end

@implementation level4MasterController

@synthesize moduleListCollection= _moduleListCollection;

- (IBAction)reload:(id)sender {
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:[NSEntityDescription entityForName:@"Module" inManagedObjectContext:context]];
    
    NSInteger year = 4;
    
    NSPredicate *pred =
    [NSPredicate predicateWithFormat:@"(level = %d)",
     year];
    [request setPredicate:pred];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    [request setSortDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    
    NSError *error = nil;
    NSArray *collection = [context executeFetchRequest:request error:&error];
    _moduleListCollection = [[NSMutableArray alloc] initWithArray:collection];
    
    [self.tableView reloadData];
   // NSLog( @"%@", [_moduleListCollection valueForKey:@"name"] );
    
    
}



- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.dataSource = self;

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:[NSEntityDescription entityForName:@"Module" inManagedObjectContext:context]];
    
    NSInteger year = 4;
    
    NSPredicate *pred =
    [NSPredicate predicateWithFormat:@"(level = %d)",
     year];
    [request setPredicate:pred];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    [request setSortDescriptors:[NSArray arrayWithObject:sortDescriptor]];
        
    NSError *error = nil;
    NSArray *collection = [context executeFetchRequest:request error:&error];
      _moduleListCollection = [[NSMutableArray alloc] initWithArray:collection];
    //_moduleListCollection =[[NSMutableArray alloc]] init
   // NSLog(@"%@", [NSNumber numberWithInt:[_moduleListCollection count]]);
     // NSLog(@"%@", [NSNumber numberWithInt:[collection count]]);
    //NSLog(@"array: %@", _moduleListCollection);
    //NSLog( @"%@", [_moduleListCollection valueForKey:@"name"] );
    
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_moduleListCollection count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
   UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NSIndexPath *p = indexPath;
    NSInteger row = p.row;
    
    
    NSManagedObject *object =  [_moduleListCollection objectAtIndex:row];
    cell.textLabel.text = [[object valueForKey:@"name"] description];
    cell.detailTextLabel.text = [[object valueForKey:@"code"] description];
    
    
    
    //[self.moduleListCollection objectAtIndex:indexPath.row];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];

    
    return cell;
    
  
    

}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
    

}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) { // if my table is clicked
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow]; //define the path for selected row
        NSArray *object = _moduleListCollection[indexPath.row]; //put only selected lecturer to new array
       // NSLog(@"array: %@", _moduleListCollection);
        //NSLog(@"String %@", object);// show me what is inside
        [[segue destinationViewController] setDetailItem:object]; // send the array to the next view
    }
    
}

@end
