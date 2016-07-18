//
//  DMCourse.h
//  CoreDataTest
//
//  Created by sublio on 18/07/16.
//  Copyright (c) 2016 sublio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "DMObject.h"

@class DMStudent, DMUniversity;

@interface DMCourse : DMObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) DMUniversity *university;
@property (nonatomic, retain) NSSet *students;
@end

@interface DMCourse (CoreDataGeneratedAccessors)

- (void)addStudentsObject:(DMStudent *)value;
- (void)removeStudentsObject:(DMStudent *)value;
- (void)addStudents:(NSSet *)values;
- (void)removeStudents:(NSSet *)values;

@end
