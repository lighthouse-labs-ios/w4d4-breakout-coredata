//
//  AddListViewController.m
//  w4d4-breakout-coredata
//
//  Created by Kareem Sabri on 2017-05-25.
//  Copyright © 2017 Kareem Sabri. All rights reserved.
//

#import "AppDelegate.h"
#import "AddListViewController.h"
#import "List+CoreDataClass.h"
#import "List+CoreDataProperties.h"

@interface AddListViewController ()
@property (weak, nonatomic) IBOutlet UITextField *listNameTextField;
@property (weak, nonatomic) IBOutlet UIButton *addListButton;
@property (weak, nonatomic) NSManagedObjectContext *context;

@end

@implementation AddListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    self.context = delegate.persistentContainer.viewContext;
}

- (IBAction)didTapAddList:(id)sender {
    List *list = [[List alloc] initWithContext:self.context];
    list.name = self.listNameTextField.text;
    NSError *error = nil;
    [self.context save:&error];
    [self.navigationController popViewControllerAnimated:true];
}

@end
