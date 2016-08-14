//
//  DMCoursesViewController.m
//  CoreDataTest
//
//  Created by sublio on 14/08/16.
//  Copyright (c) 2016 Alex Skutarenko. All rights reserved.
//

#import "DMCoursesViewController.h"
#import "ASUniversity.h"
#import "ASCourse.h"

@interface DMCoursesViewController ()

@end

@implementation DMCoursesViewController

@synthesize fetchedResultsController = _fetchedResultsController;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    
    NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription* description =
    [NSEntityDescription entityForName:@"ASCourse"
                inManagedObjectContext:self.managedObjectContext];
    
    [fetchRequest setEntity:description];
    
    NSSortDescriptor* nameDescription =
    [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    
    [fetchRequest setSortDescriptors:@[nameDescription]];
    
    //[fetchRequest setResultType:NSCountResultType];
    
    
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"university == %@",self.university];
    
    [fetchRequest setPredicate:predicate];
    
    
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    
    aFetchedResultsController.delegate = self;
    
    self.fetchedResultsController = aFetchedResultsController;
    
    
    
    NSError *error = nil;
    if (![self.fetchedResultsController performFetch:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    /*
     NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
     // Edit the entity name as appropriate.
     NSEntityDescription *entity = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:self.managedObjectContext];
     [fetchRequest setEntity:entity];
     
     // Set the batch size to a suitable number.
     [fetchRequest setFetchBatchSize:20];
     
     // Edit the sort key as appropriate.
     NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"timeStamp" ascending:NO];
     NSArray *sortDescriptors = @[sortDescriptor];
     
     [fetchRequest setSortDescriptors:sortDescriptors];
     
     // Edit the section name key path and cache name if appropriate.
     // nil for section name key path means "no sections".
     NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"Master"];
     aFetchedResultsController.delegate = self;
     self.fetchedResultsController = aFetchedResultsController;
     
     NSError *error = nil;
     if (![self.fetchedResultsController performFetch:&error]) {
     // Replace this implementation with code to handle the error appropriately.
     // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
     NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
     abort();
     }*/
    
    return _fetchedResultsController;
}

#pragma mark - UITableViewDataSource

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath{
    
    ASCourse* course = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.textLabel.text = course.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d", [course.students count]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
}

#pragma  mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ASCourse* course = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    /*
    DMCoursesViewController* vc = [[DMCoursesViewController alloc]init];
    vc.university = university;
    
    [self.navigationController pushViewController:vc animated:YES];*/
    
}


@end
