//
//  NewModel.h
//  Sdgift
//
//  Created by Kevin on 15/12/6.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import "KVBaseModle.h"
#import "RecomModel.h"
@interface NewModel : KVBaseModle<RecomModel>

@property(nonatomic)NSString *comic_update_time;
@property(nonatomic)NSString *comic_update_ymd;
@property(nonatomic)NSString *week_number;
@property(nonatomic)NSString *show_time;
@property(nonatomic)NSString *offset;
@property(nonatomic)NSString *is_first;
@property(nonatomic)NSArray <RecomModel>*comic_arr;

+ (NSArray *)pareRespondData:(NSDictionary *)respondData;
@end
