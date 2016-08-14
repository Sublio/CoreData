//
//  ASStudentViewController.h
//  CoreDataTest
//
//  Created by sublio on 14/08/16.
//  Copyright (c) 2016 Alex Skutarenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ASCourse;

@interface ASStudentViewController : ASCoreDataTableViewController

@property (strong, nonatomic) ASCourse* course;

@end
