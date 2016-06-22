//
//  DMUniversity.h
//  CoreDataTest
//
//  Created by sublio on 22/06/16.
//  Copyright (c) 2016 sublio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "DMObject.h"

@class DMStudent;

@interface DMUniversity : DMObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *students;
@end

@interface DMUniversity (CoreDataGeneratedAccessors)

- (void)addStudentsObject:(DMStudent *)value;
- (void)removeStudentsObject:(DMStudent *)value;
- (void)addStudents:(NSSet *)values;
- (void)removeStudents:(NSSet *)values;

@end
