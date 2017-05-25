//
//  TasksViewController.m
//  w4d4-breakout-coredata
//
//  Created by Kareem Sabri on 2017-05-25.
//  Copyright © 2017 Kareem Sabri. All rights reserved.
//

#import "TasksViewController.h"
#import "TaskTableViewCell.h"
#import "AppDelegate.h"
#import "AddTaskViewController.h"

@interface TasksViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) NSManagedObjectContext *context;
@property (strong, nonatomic) NSMutableDictionary<NSNumber*,NSMutableArray<ToDo*>*> *todosByPriority;
@end

@implementation TasksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    self.context = delegate.persistentContainer.viewContext;
    self.todosByPriority = [[NSMutableDictionary alloc] initWithCapacity:3];
    for (ToDo *t in self.list.todos) {
        if (self.todosByPriority[@(t.priority)]) {
            [self.todosByPriority[@(t.priority)] addObject:t];
        } else {
            self.todosByPriority[@(t.priority)] = [[NSMutableArray<ToDo*> alloc] initWithObjects:t, nil];
        }
    }
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.tableView reloadData];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"goToAddTaskViewController"]) {
        AddTaskViewController *vc = segue.destinationViewController;
        vc.list = self.list;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    self.todosByPriority.allKeys.count;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return @"Low";
            break;
        case 1:
            return @"Medium";
        case 2:
            return @"High";
        default:
            return 0;
            break;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSNumber *priority = @(section + 1);
    return self.todosByPriority[priority].count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TaskTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TaskTableViewCell" forIndexPath:indexPath];
    cell.todo = self.todosByPriority[@(indexPath.section+1)][indexPath.row];
    [cell updateDisplay];
    return cell;
}
@end
