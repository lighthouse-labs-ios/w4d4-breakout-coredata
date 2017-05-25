//
//  ListTableViewCell.m
//  w4d4-breakout-coredata
//
//  Created by Kareem Sabri on 2017-05-25.
//  Copyright © 2017 Kareem Sabri. All rights reserved.
//

#import "ListTableViewCell.h"

@interface ListTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *listNameLabel;

@end

@implementation ListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)updateDisplay {
    self.listNameLabel.text = [NSString stringWithFormat:@"%@ (%lu)", self.list.name, self.list.todos.count];
}

@end
