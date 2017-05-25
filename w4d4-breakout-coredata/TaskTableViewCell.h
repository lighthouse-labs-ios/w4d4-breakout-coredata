//
//  TaskTableViewCell.h
//  w4d4-breakout-coredata
//
//  Created by Kareem Sabri on 2017-05-25.
//  Copyright © 2017 Kareem Sabri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo+CoreDataClass.h"

@interface TaskTableViewCell : UITableViewCell

@property (nonatomic, strong) ToDo *todo;
-(void)updateDisplay;

@end
