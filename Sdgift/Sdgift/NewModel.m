//
//  NewModel.m
//  Sdgift
//
//  Created by Kevin on 15/12/6.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import "NewModel.h"

@implementation NewModel

+ (NSArray *)pareRespondData:(NSDictionary *)respondData
{
    NSMutableArray *dataSource = [NSMutableArray array];
    NSArray *totalArr = respondData[@"new_comic_arr"];
    for (NSDictionary *dic in totalArr) {
        NewModel *model = [[NewModel alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [dataSource addObject:model];
    }
    NSLog(@"//%@",dataSource);
    return dataSource;
}

@end
