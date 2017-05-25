//
//  ToDo+CoreDataProperties.h
//  w4d4-breakout-coredata
//
//  Created by Kareem Sabri on 2017-05-25.
//  Copyright © 2017 Kareem Sabri. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "ToDo+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface ToDo (CoreDataProperties)

+ (NSFetchRequest<ToDo *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *task;
@property (nonatomic) BOOL completed;
@property (nonatomic) int16_t priority;
@property (nullable, nonatomic, retain) List *list;

@end

NS_ASSUME_NONNULL_END
