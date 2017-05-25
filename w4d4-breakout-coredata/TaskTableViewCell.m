//
//  TaskTableViewCell.m
//  w4d4-breakout-coredata
//
//  Created by Kareem Sabri on 2017-05-25.
//  Copyright © 2017 Kareem Sabri. All rights reserved.
//

#import "TaskTableViewCell.h"

@interface TaskTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *taskLabel;
@end

@implementation TaskTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)updateDisplay {
    self.taskLabel.text = self.todo.task;
    if (self.todo.completed) {
        self.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        self.accessoryType = UITableViewCellAccessoryNone;
    }
}

@end
