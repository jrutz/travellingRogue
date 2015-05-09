//
//  DetailViewController.m
//  FinalApp
//
//  Created by Jason Stumbaugh on 5/4/15.
//  Copyright (c) 2015 Jason Stumbaugh. All rights reserved.
//

#import "DetailViewController.h"

@interface detailViewController ()

@property (strong, nonatomic) NSMutableDictionary* screenSize;

@end

@implementation detailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // this code is to ge the screen size of the hardware you are using
    self.screenSize = [[NSMutableDictionary alloc] init];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    NSNumber *height = [[NSNumber alloc] initWithDouble:screenHeight];
    NSNumber *width = [[NSNumber alloc] initWithDouble:screenWidth];
    self.screenSize[@"height"] = height;
    self.screenSize[@"width"] = width;
    

    UIImageView* imageView = [[UIImageView alloc] initWithImage:self.cafe.photo];
    imageView.frame = CGRectMake(0.0, 64.0, [self.screenSize[@"width"] floatValue], [self.screenSize[@"width"] floatValue]);
    [self.view addSubview:imageView];
    
    // adding the name to the subview
    UILabel* nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, [self.screenSize[@"width"] floatValue]+64, [self.screenSize[@"width"] floatValue], 40.0)];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    [nameLabel setText:self.cafe.name];
    [self.view addSubview:nameLabel];
    
    // adding the description to the subview
    UILabel* detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, [self.screenSize[@"width"] floatValue]+80, [self.screenSize[@"width"] floatValue], 40.0)];
    detailLabel.textAlignment = NSTextAlignmentCenter;
    [detailLabel setText:self.cafe.hours];
    [self.view addSubview:detailLabel];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end