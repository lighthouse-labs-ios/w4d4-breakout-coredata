//
//  List+CoreDataProperties.m
//  w4d4-breakout-coredata
//
//  Created by Kareem Sabri on 2017-05-25.
//  Copyright © 2017 Kareem Sabri. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "List+CoreDataProperties.h"

@implementation List (CoreDataProperties)

+ (NSFetchRequest<List *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"List"];
}

@dynamic name;
@dynamic todos;

@end
