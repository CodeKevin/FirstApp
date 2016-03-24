//
//  RecomModel.m
//  Sdgift
//
//  Created by Kevin on 15/12/5.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import "RecomModel.h"

@implementation RecomModel

@synthesize id = _id;
@synthesize description = _description;

+ (NSArray *)pareRespondData:(NSDictionary *)respondData
{
    NSMutableArray *totalArr = [NSMutableArray array];
    NSArray *nameArr = @[@"recommend_comic_arr",@"new_comic_arr",@"hot_comic_arr",@"like_comic_arr"];
    for (int index = 0; index <= 3; index++) {
        NSMutableArray *dataSource = [NSMutableArray array];
        NSArray *firstArr = respondData[nameArr[index]];
        for (NSDictionary *dic in firstArr) {
            RecomModel *model = [[RecomModel alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            [dataSource addObject:model];
        }
        [totalArr addObject:dataSource];
    }
    //NSLog(@"%@",totalArr);
    return totalArr;
}

@end
