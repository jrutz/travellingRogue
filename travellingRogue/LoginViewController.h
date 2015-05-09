//
//  ViewController.h
//  travellingRogue
//
//  Created by Johna Rutz on 5/4/15.
//  Copyright (c) 2015 Johna Rutz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>


@interface LoginViewController : UIViewController

@property (strong, nonatomic) NSArray*listOfCafe;
@property (nonatomic, assign) FBSDKProfilePictureMode pictureMode;
@property (nonatomic, copy) NSString *username;

- (NSString *) imagePathForPictureMode:	(FBSDKProfilePictureMode)mode size:	(CGSize)size;

@end

