//
//  ASCoreDataTableViewController.h
//  CoreDataTest
//
//  Created by sublio on 11/08/16.
//  Copyright (c) 2016 Denis Mordvinov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASCoreDataViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext* managedObjectContext;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;


@end
