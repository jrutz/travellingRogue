//
//  TableViewController.h
//  travellingRogue
//
//  Created by Johna Rutz on 5/4/15.
//  Copyright (c) 2015 Johna Rutz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"

@interface TableViewController : UITableViewController

@property (strong, nonatomic) NSArray*listOfCafe;
@property (strong, nonatomic) NSMutableArray* cafeObjects;

@end
