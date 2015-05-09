//
//  DetailViewController.m
//  FinalApp
//
//  Created by Jason Stumbaugh on 5/4/15.
//  Copyright (c) 2015 Jason Stumbaugh. All rights reserved.
//

#import "DetailViewController.h"
#import "LoginViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>


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
 
    
    // adding the name to the subview
    UILabel* nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, [self.screenSize[@"width"] floatValue]+64, [self.screenSize[@"width"] floatValue], 40.0)];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    [nameLabel setText:self.cafe.name];

    UILabel* hoursLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, [self.screenSize[@"width"] floatValue]+100, [self.screenSize[@"width"] floatValue], 40.0)];
    hoursLabel.textAlignment = NSTextAlignmentCenter;
    [hoursLabel setText:@"Hours of Operation"];
    
    // adding the description to the subview
    UILabel* detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, [self.screenSize[@"width"] floatValue]+120, [self.screenSize[@"width"] floatValue], 40.0)];
    detailLabel.textAlignment = NSTextAlignmentCenter;
    [detailLabel setText:self.cafe.hours];
   
    
    UILabel* addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, [self.screenSize[@"width"] floatValue]+140, [self.screenSize[@"width"] floatValue], 40.0)];
    addressLabel.textAlignment = NSTextAlignmentCenter;
    [addressLabel setText:self.cafe.detail];

    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0.0, [self.screenSize[@"width"] floatValue]+180, [self.screenSize[@"width"] floatValue], 400.0)];
    
    
    NSString *urlString = [NSString stringWithFormat:@"https://www.google.com/maps/place/%@/", _cafe.name];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [webView loadRequest:urlRequest];
   
    
    FBSDKLikeControl *button = [[FBSDKLikeControl alloc] initWithFrame:CGRectMake(100.0,[self.screenSize[@"width"] floatValue]+600, [self.screenSize[@"width"] floatValue], 400.0)];
   
    button.objectID = self.cafe.fbLink;
    
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    
    
    [scrollView setContentSize:CGSizeMake(scrollView.bounds.size.width, scrollView.bounds.size.height*2)];
    [self.view addSubview:scrollView];
    scrollView.pagingEnabled = YES;
    
    //Adding all views to the scrollView
    [scrollView addSubview:button];
    [scrollView addSubview:hoursLabel];
    [scrollView addSubview:imageView];
    [scrollView addSubview:nameLabel];
    [scrollView addSubview:detailLabel];
    [scrollView addSubview:addressLabel];
    [scrollView addSubview:webView];
    
    
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