//
//  ToDo+CoreDataProperties.m
//  w4d4-breakout-coredata
//
//  Created by Kareem Sabri on 2017-05-25.
//  Copyright © 2017 Kareem Sabri. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "ToDo+CoreDataProperties.h"

@implementation ToDo (CoreDataProperties)

+ (NSFetchRequest<ToDo *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"ToDo"];
}

@dynamic task;
@dynamic completed;
@dynamic priority;
@dynamic list;

@end
