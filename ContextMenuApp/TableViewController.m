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
