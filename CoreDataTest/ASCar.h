//
//  ASCar.h
//  CoreDataTest
//
//  Created by Denis Mordvinov on 31.01.16.
//  Copyright (c) 2016 Denis Mordvinov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "ASObject.h"

@class ASStudent;

@interface ASCar : ASObject

@property (nonatomic, retain) NSString * model;
@property (nonatomic, retain) ASStudent *owner;

@end
