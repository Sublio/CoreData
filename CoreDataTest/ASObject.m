//
//  ASObject.m
//  CoreDataTest
//
//  Created by Denis Mordvinov on 31.01.16.
//  Copyright (c) 2016 Denis Mordvinov. All rights reserved.
//

#import "ASObject.h"


@implementation ASObject


- (BOOL)validateForDelete:(NSError **)error {
    NSLog(@"%@ validateForDelete", NSStringFromClass([self class]));
    
    return YES;
}

@end
