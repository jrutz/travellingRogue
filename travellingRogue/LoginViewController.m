//
//  ViewController.m
//  travellingRogue
//
//  Created by Johna Rutz on 5/4/15.
//  Copyright (c) 2015 Johna Rutz. All rights reserved.
//

#import "Cafe.h"
#import "TableViewController.h"
#import "LoginViewController.h"


@interface LoginViewController ()

@property (strong, nonatomic) NSMutableDictionary* screenSize;
@property (strong, nonatomic) NSMutableArray* objects;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.screenSize = [[NSMutableDictionary alloc] init];
    
    
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    NSNumber *height = [[NSNumber alloc] initWithDouble:screenHeight];
    NSNumber *width = [[NSNumber alloc] initWithDouble:screenWidth];
    
[FBSDKProfile enableUpdatesOnAccessTokenChange:YES];
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] initWithFrame:CGRectMake(165.0, 400.0, [self.screenSize[@"width"] floatValue], 80.0)];
    
    [self.view addSubview:loginButton];

    
    if ([FBSDKAccessToken currentAccessToken]) {
        // User is logged in, do work such as go to next view controller.
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
             if (!error) {
                 NSLog(@"fetched user:%@", result);
                 NSString *name = result[@"name"];
                 
                 UILabel* welcomeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 100, [self.screenSize[@"width"] floatValue], 80)];
                 welcomeLabel.textAlignment = NSTextAlignmentCenter;
                 welcomeLabel.textColor = [UIColor whiteColor];
                 welcomeLabel.font = [UIFont systemFontOfSize:60];
                 [welcomeLabel setBackgroundColor:[UIColor grayColor]];
                 [welcomeLabel setAdjustsFontSizeToFitWidth:YES];
                 welcomeLabel.shadowColor=[UIColor whiteColor];
                
                 [welcomeLabel setText:name];
                 [self.view addSubview:welcomeLabel];
             }
             
         }];
    }
    
    
    self.screenSize[@"height"] = height;
    self.screenSize[@"width"] = width;
    
    UIColor* background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"floral.jpg"]];
    self.view.backgroundColor = background;
    
    
    
    UIColor *color = [UIColor grayColor];
    
    UIButton* viewCoffee = [UIButton buttonWithType:UIButtonTypeCustom];
    [viewCoffee setBackgroundColor: color]; /* white */
    [viewCoffee setTitle:@"View List of Coffee Houses" forState:UIControlStateNormal];
    viewCoffee.center = self.view.center;
    viewCoffee.frame = CGRectMake(0.0, 320.0, [self.screenSize[@"width"] floatValue], 50.0);
    
    //usage
    [viewCoffee addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:viewCoffee];
    
    [self getCafe];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)buttonClicked {
    
    [self performSegueWithIdentifier:@"tableViewSegway" sender:self];
    
}


- (void) getCafe {
    NSURL *URL = [NSURL URLWithString:@"http://private-cad91-jsquared.apiary-mock.com/notes"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    [request setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error) {
                                      
                                      if (error) {
                                          // Handle error...
                                          return;
                                      }
                                      
                                      if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
                                          NSLog(@"Response HTTP Status code: %ld\n", (long)[(NSHTTPURLResponse *)response statusCode]);
                                          NSLog(@"Response HTTP Headers:\n%@\n", [(NSHTTPURLResponse *)response allHeaderFields]);
                                      }
                                      
                                      NSString* body = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                      NSLog(@"Response Body:\n%@\n", body);
                                      
                                      NSError *e = nil;
                                      _listOfCafe = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &e];
                                      
                                      if (! _listOfCafe) {
                                          NSLog(@"Error parsing JSON: %@", e);
                                      } else {
                                          for(NSDictionary *item in  _listOfCafe) {
                                              NSLog(@"Item: %@", item);
                                          }
                                      }
                                      
                                      self.objects = [self createEachCafe];
                                      
                                  }];
    [task resume];
    
}

- (NSMutableArray*) createEachCafe {
    NSMutableArray* cafes = [[NSMutableArray alloc] init];
    
    NSLog(@"Creating each cafe");
    for(NSDictionary *item in  _listOfCafe) {
        
        Cafe* temp = [[Cafe alloc] initWithName:item[@"name"] andPhoto:[UIImage imageNamed:item[@"img"]] andHours:item[@"hours"] andDetail:item[@"detail"] andFacebook:item[@"facebook"]];
        
        [cafes addObject:temp];
    }
    
    return cafes;
}


// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    TableViewController* destination = segue.destinationViewController;
    destination.cafeObjects = self.objects;
}


@end
