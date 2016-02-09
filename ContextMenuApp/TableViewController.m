//
//  TableViewController.m
//  ThesisApp
//
//  Created by Mehul Chopda on 07/08/15.
//  Copyright (c) 2015 Mehul Chopda. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()
@property (nonatomic, retain) NSDictionary *countries;


@end

@implementation TableViewController
@synthesize countries;
@synthesize exifDictionary;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"Diction:=%@",exifDictionary);
    
   // self.countries = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"countries" ofType:@"plist"]];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
   // return [self.countries count];
    return 1;
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//   // return [[self.countries allKeys] objectAtIndex:section];
//    return [[self.exifDictionary allKeys] objectAtIndex:section];
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //NSString *continent = [self tableView:tableView titleForHeaderInSection:section];
  //  return [[self.exifDictionary valueForKey:continent] count];
    return [self.exifDictionary count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //static NSString *CellIdentifier = @"CountryCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MetadataCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MetadataCell"];
    }
    
    // Configure the cell...
   // NSString *continent = [self tableView:tableView titleForHeaderInSection:indexPath.section];
// NSArray *keys = [exifDictionary allKeys];
//    for (NSString *key in keys) {
//        //NSLog(@";%@ is %@",key, [rowSelect objectForKey:key]);
//        cell.textLabel.text = key;
//        NSString *value = [NSString stringWithFormat:@"%@ = %@", key, [exifDictionary objectForKey:key]];
//        cell.detailTextLabel.text=value;
//        NSLog(@"cellValue: %@", value);
//        cell.textLabel.textColor = [UIColor blackColor];
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        
//        
//        
//    }
    NSString *name = [[exifDictionary allKeys] objectAtIndex:indexPath.row];
    NSString *value = [exifDictionary objectForKey:name];
    
    NSLog(@"Name = %@ & Value = %@", name, value);
    
    //UITableView *cell = [table dequeueReusableCellWithIdentifier:@"MyCell"];
    
    if (!cell) {
        
        NSLog(@"keine Cell");
        
    }
    
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", name];
    cell.detailTextLabel.text= [NSString stringWithFormat:@"%@", value];
    return cell;
    

    
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *continent = [self tableView:tableView titleForHeaderInSection:indexPath.section];
    NSString *country = [[self.exifDictionary valueForKey:continent] objectAtIndex:indexPath.row];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:[NSString stringWithFormat:@"You selected %@!", country]
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
