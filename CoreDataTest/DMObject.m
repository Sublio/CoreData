//
//  DMObject.m
//  CoreDataTest
//
//  Created by sublio on 11/06/16.
//  Copyright (c) 2016 sublio. All rights reserved.
//

#import "DMObject.h"


@implementation DMObject


-(BOOL) validateForDelete:(NSError **)error{
    
    NSLog(@"ValidateForDelete %@", NSStringFromClass([self class]));
    
    return YES;
};


@end
