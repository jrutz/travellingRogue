//
//  Cafe.m
//  travellingRogue
//
//  Created by Johna Rutz on 5/8/15.
//  Copyright (c) 2015 Johna Rutz. All rights reserved.
//

#import "Cafe.h"

@implementation Cafe

-(id)initWithName:(NSString*)name andPhoto:(UIImage*)photo andHours:(NSString*)hours andDetail:(NSString*)detail andFacebook:(NSString *)fbLink;
{
    self = [super init];
    
    self.name = name;
    self.photo = photo;
    self.detail = detail;
    self.hours = hours;
    self.fbLink = fbLink;
    
  
    return self;
}

@end
