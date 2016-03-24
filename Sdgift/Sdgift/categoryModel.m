//
//  categoryModel.m
//  Sdgift
//
//  Created by Kevin on 15/12/5.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import "categoryModel.h"

@implementation categoryModel
@synthesize id = _id;

+ (NSArray *)pareRespondData:(NSArray *)respondData
{

    NSMutableArray *totalArr = [NSMutableArray array];
    for (NSDictionary *dic in respondData) {
        NSArray *oneArr = dic[@"arr"];
        NSMutableArray *partDataSource = [NSMutableArray array];
        for (NSDictionary *modelDic in oneArr) {
            categoryModel *model = [[categoryModel alloc] init];
            [model setValuesForKeysWithDictionary:modelDic];
            [partDataSource addObject:model];
        }
        [totalArr addObject:partDataSource];
    }
    return totalArr;
}


@end
