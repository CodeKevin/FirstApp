//
//  ActiveModel.m
//  Sdgift
//
//  Created by Kevin on 15/12/6.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import "ActiveModel.h"

@implementation ActiveModel
@synthesize id = _id;

+ (NSArray *)pareRespondData:(NSDictionary *)respondData
{
    NSMutableArray *dataSource = [NSMutableArray array];
    NSArray *totalArr = respondData[@"active_arr"];
    for (NSDictionary *dic in totalArr) {
        ActiveModel *model = [[ActiveModel alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [dataSource addObject:model];
    }
    return dataSource;
}
@end
