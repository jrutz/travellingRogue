//
//  detailViewController.h
//  travellingRogue
//
//  Created by Johna Rutz on 5/4/15.
//  Copyright (c) 2015 Johna Rutz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cafe.h"
#import "Student.h"

@interface detailViewController : UIViewController

@property (strong, nonatomic) Cafe* cafe;
@property (strong, nonatomic) Student* student;

@end
