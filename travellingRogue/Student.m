//
//  Student.m
//  travellingRogue
//
//  Created by Johna Rutz on 5/4/15.
//  Copyright (c) 2015 Johna Rutz. All rights reserved.
//

#import "Student.h"


@implementation Student

-(id)initWithName:(NSString*)name andPhoto:(UIImage*)photo andDetail:(NSString*)detail
{
    self = [super init];
    
    self.name = name;
    self.photo = photo;
    self.detail = detail;
    
    return self;
}

@end
