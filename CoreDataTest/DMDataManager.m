//
//  DMDataManager.m
//  CoreDataTest
//
//  Created by sublio on 10/08/16.
//  Copyright (c) 2016 Alex Skutarenko. All rights reserved.
//

#import "DMDataManager.h"

@implementation DMDataManager


+(DMDataManager*) sharedManager{
    
    
    static DMDataManager* manager = nil;
    
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[DMDataManager alloc] init];
    });
    
    return manager;
}

@end
