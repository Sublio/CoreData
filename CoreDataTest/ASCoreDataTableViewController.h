//
//  ASCoreDataTableViewController.h
//  CoreDataTest
//
//  Created by sublio on 11/08/16.
//  Copyright (c) 2016 Alex Skutarenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASCoreDataTableViewController : UITableViewController

@property (strong, nonatomic) NSManagedObjectContext* managedObjectContext;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;


@end
