//
//  TableViewController.h
//  ThesisApp
//
//  Created by Mehul Chopda on 07/08/15.
//  Copyright (c) 2015 Mehul Chopda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController{
    NSDictionary *countries;
     NSDictionary *exifDictionary;
   }
@property (nonatomic, strong) NSDictionary *exifDictionary;
@end
