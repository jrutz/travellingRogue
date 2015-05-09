//
//  Student.h
//  travellingRogue
//
//  Created by Johna Rutz on 5/4/15.
//  Copyright (c) 2015 Johna Rutz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Student : NSObject


@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* detail;
@property (strong, nonatomic) UIImage* photo;


-(id)initWithName:(NSString*)name andPhoto:(UIImage*)photo andDetail:(NSString*)detail;

@end
