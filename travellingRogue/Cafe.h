//
//  Cafe.h
//  travellingRogue
//
//  Created by Johna Rutz on 5/8/15.
//  Copyright (c) 2015 Johna Rutz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Cafe : NSObject

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* detail;
@property (strong, nonatomic) NSString* hours;
@property (strong, nonatomic) UIImage* photo;
@property (strong, nonatomic) NSString* fbLink;


-(id)initWithName:(NSString*)name andPhoto:(UIImage*)photo andHours:(NSString*)hours andDetail:(NSString*)detail andFacebook:(NSString*)fbLink;


@end
