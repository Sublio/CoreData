//
//  AppDelegate.m
//  CoreDataTest
//
//  Created by sublio on 04/06/16.
//  Copyright (c) 2016 sublio. All rights reserved.
//

#import "AppDelegate.h"
#import "DMStudent.h"

@interface AppDelegate ()

@end


static NSString* firstNames[] = {
    @"Tran", @"Lenore", @"Bud", @"Fredda", @"Katrice", @"Clyde", @"Hildegard",
    @"Vernell", @"Nellie", @"Rupert", @"Billie", @"Tamica", @"Crystle", @"Kandi", @"Caridad",
    @"Vanetta", @"Taylor", @"Pinkie", @"Ben", @"Rosanna", @"Eufemia", @"Brittney", @"Ramon",
    @"Jacque", @"Telma", @"Colton", @"Monte", @"Pam", @"Tracy", @"Tresa", @"Willard", @"Mireille",
    @"Roma", @"Elise", @"Trang", @"Ty", @"Pierre", @"Floyd", @"Savanna", @"Arvilla", @"Whitney",
    @"Denver", @"Norbert", @"Meghan",@"Tandra", @"Jenise", @"Brent",@"Elenor", @"Sha",@"Jessie"
};

static NSString* lastNames[] = {
    @"Farrah", @"Laviolette", @"Heal", @"Sechrest", @"Roots", @"Homan", @"Starns", @"Oldham", @"Yocum",
    @"Mancia", @"Prill", @"Lush", @"Piedra", @"Castenada", @"Warnock", @"Vanderlinden", @"Simms",@"Gilroy",
    @"Brann", @"Bodden", @"Lenz", @"Gildersleeve", @"Wimbish", @"Bello", @"Beachy", @"Jurado", @"William",
    @"Beapure", @"Dyal", @"Doiron", @"Plourde", @"Bator", @"Krause", @"Odriscoll", @"Corby", @"Waltman",
    @"Michaud", @"Kobayashi", @"Sherrick", @"Wollfolk", @"Holladay", @"Hornback", @"Moler", @"Bowles",
    @"Libbey", @"Spano", @"Folson", @"Arguelles", @"Burke", @"Rook"
};


@implementation AppDelegate



-(DMStudent*) addRandomStudent {
    
    DMStudent* student = [NSEntityDescription insertNewObjectForEntityForName:@"DMStudent" inManagedObjectContext:self.managedObjectContext];
    student.score = @((float)arc4random_uniform(201)/200.f +2);
    student.dateOfBirth = [NSDate dateWithTimeIntervalSince1970:60*60*24*365* arc4random_uniform(31)];
    student.firstName = firstNames[arc4random_uniform(50)];
    student.lastName = lastNames[arc4random_uniform(50)];
    
    return student;
};


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    
    //NSLog(@"%@",[self.managedObjectModel entitiesByName]);
    self.managedObjectContext;
    /*
    NSManagedObject* student = [NSEntityDescription insertNewObjectForEntityForName:@"DMStudent" inManagedObjectContext:self.managedObjectContext];
    
    [student setValue:@"Denis" forKey:@"firstName"];
    [student setValue:@"Mordvinov" forKey:@"lastName"];
    [student setValue:[NSDate dateWithTimeIntervalSinceReferenceDate:0] forKey:@"dateOfBirth"];
    [student setValue:@4 forKey:@"score"];
    
    NSError* error  = nil;
    
    if (![self.managedObjectContext save:&error]){
        
        NSLog(@"%@", [error localizedDescription]);
    }
    
    */
    DMStudent* student = [self addRandomStudent];
    [student.managedObjectContext save:nil];
    
    NSFetchRequest* request = [[NSFetchRequest alloc]init];
  
    NSEntityDescription* description = [NSEntityDescription entityForName:@"DMStudent" inManagedObjectContext:self.managedObjectContext];
    
    
    [request setEntity:description];
    //[request setResultType:NSDictionaryResultType];
    
    NSError* fetchError = nil;
    
    NSArray* resultArray =  [self.managedObjectContext executeFetchRequest:request error:&fetchError];
    
    if (fetchError){
        
        NSLog(@"%@", [fetchError localizedDescription]);
    }
    /*
    
    NSLog(@"%@", resultArray);
    
    for (NSManagedObject* object in resultArray){
        
        
        NSLog(@"%@, %@ - %@", [object valueForKey:@"firstName"], [object valueForKey:@"lastName"], [object valueForKey:@"score"] );
        
    }*/
    
    for (DMStudent* object in resultArray){
        
        
        //NSLog(@"%@, %@ - %@", object.firstName, object.lastName, object.score);
        
        NSLog(@"%@", object);
        
    }
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "NoName.CoreDataTest" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"CoreDataTest" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"CoreDataTest.sqlite"];
    
    NSError *error = nil;
   
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        
        
        
        [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil];
        
        [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error];
       
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
