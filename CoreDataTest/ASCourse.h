//
//  ASAppDelegate.m
//  CoreDataTest
//
//  Created by Denis Mordvinov on 31.01.16.
//  Copyright (c) 2016 Denis Mordvinov. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "ASObject.h"

@class ASStudent, ASUniversity;

@interface ASCourse : ASObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) ASUniversity *university;
@property (nonatomic, retain) NSSet *students;
@end

@interface ASCourse (CoreDataGeneratedAccessors)

- (void)addStudentsObject:(ASStudent *)value;
- (void)removeStudentsObject:(ASStudent *)value;
- (void)addStudents:(NSSet *)values;
- (void)removeStudents:(NSSet *)values;

@end
