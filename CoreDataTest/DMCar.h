//
//  DMCar.h
//  CoreDataTest
//
//  Created by sublio on 11/06/16.
//  Copyright (c) 2016 sublio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "DMObject.h"

@class DMStudent;

@interface DMCar : DMObject

@property (nonatomic, retain) NSString * model;
@property (nonatomic, retain) DMStudent *owner;

@end
