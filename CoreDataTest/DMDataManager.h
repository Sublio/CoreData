//
//  DMDataManager.h
//  CoreDataTest
//
//  Created by sublio on 10/08/16.
//  Copyright (c) 2016 Denis Mordvinov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DMDataManager : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

+ (DMDataManager*) sharedManager;

- (void) generateAndAddUniversity;


@end
