//
//  List+CoreDataProperties.h
//  w4d4-breakout-coredata
//
//  Created by Kareem Sabri on 2017-05-25.
//  Copyright © 2017 Kareem Sabri. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "List+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface List (CoreDataProperties)

+ (NSFetchRequest<List *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) NSSet<ToDo *> *todos;

@end

@interface List (CoreDataGeneratedAccessors)

- (void)addTodosObject:(ToDo *)value;
- (void)removeTodosObject:(ToDo *)value;
- (void)addTodos:(NSSet<ToDo *> *)values;
- (void)removeTodos:(NSSet<ToDo *> *)values;

@end

NS_ASSUME_NONNULL_END
