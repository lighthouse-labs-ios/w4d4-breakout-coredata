//
//  AddTaskViewController.m
//  w4d4-breakout-coredata
//
//  Created by Kareem Sabri on 2017-05-25.
//  Copyright © 2017 Kareem Sabri. All rights reserved.
//

#import "AddTaskViewController.h"
#import "AppDelegate.h"
#import "ToDo+CoreDataClass.h"

@interface AddTaskViewController ()
@property (weak, nonatomic) IBOutlet UITextField *taskNameTextField;
@property (weak, nonatomic) NSManagedObjectContext *context;
@end

@implementation AddTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    self.context = delegate.persistentContainer.viewContext;
}

- (IBAction)didTapAddTask:(id)sender {
    ToDo *task = [[ToDo alloc] initWithContext:self.context];
    task.task = self.taskNameTextField.text;
    task.priority = arc4random_uniform(3)+1;
    [self.list addTodosObject:task];
    NSError *error = nil;
    [self.context save:&error];
    [self.navigationController popViewControllerAnimated:true];
}

@end
