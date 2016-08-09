//
//  ASStudent.h
//  CoreDataTest
//
//  Created by Denis Mordvinov on 31.01.16.
//  Copyright (c) 2016 Denis Mordvinov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "ASObject.h"

@class ASCar, ASCourse, ASUniversity;

@interface ASStudent : ASObject

@property (nonatomic, retain) NSDate * dateOfBirth;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSNumber * score;
@property (nonatomic, retain) ASCar *car;
@property (nonatomic, retain) ASUniversity *university;
@property (nonatomic, retain) NSSet *courses;
@end

@interface ASStudent (CoreDataGeneratedAccessors)

- (void)addCoursesObject:(ASCourse *)value;
- (void)removeCoursesObject:(ASCourse *)value;
- (void)addCourses:(NSSet *)values;
- (void)removeCourses:(NSSet *)values;

@end
