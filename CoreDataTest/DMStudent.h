//
//  DMStudent.h
//  CoreDataTest
//
//  Created by sublio on 11/06/16.
//  Copyright (c) 2016 sublio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "DMObject.h"

@class DMCar;

@interface DMStudent : DMObject

@property (nonatomic) NSTimeInterval dateOfBirth;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic) double score;
@property (nonatomic, retain) DMCar *car;

@end
