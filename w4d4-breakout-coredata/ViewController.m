//
//  ViewController.m
//  w4d4-breakout-coredata
//
//  Created by Kareem Sabri on 2017-05-25.
//  Copyright © 2017 Kareem Sabri. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "List+CoreDataClass.h"
#import "ListTableViewCell.h"
#import "TasksViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) NSManagedObjectContext *context;
@property (strong, nonatomic) NSArray<List*>* lists;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    self.context = delegate.persistentContainer.viewContext;
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSFetchRequest<List*> *request = [List fetchRequest];
    NSError *error = nil;
    self.lists = [self.context executeFetchRequest:request error:&error];
    if (error == nil) {
        //@todo: handle error
    }
    [self.tableView reloadData];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"goToTasksViewController"]) {
        TasksViewController *vc = [segue destinationViewController];
        vc.list = sender;
    }
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.lists.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListTableViewCell" forIndexPath:indexPath];
    cell.list = self.lists[indexPath.row];
    [cell updateDisplay];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    List *list = self.lists[indexPath.row];
    [self performSegueWithIdentifier:@"goToTasksViewController" sender:list];
}




@end
