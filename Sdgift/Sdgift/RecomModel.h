//
//  RecomModel.h
//  Sdgift
//
//  Created by Kevin on 15/12/5.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import "KVBaseModle.h"

@protocol  RecomModel <NSObject>
@end

@interface RecomModel : KVBaseModle

@property(nonatomic)NSString *id;
@property(nonatomic)NSString *comic_name;
@property(nonatomic)NSString *comic_desc;
@property(nonatomic)NSString *comic_sort_id;
@property(nonatomic)NSString *comic_update_time;
@property(nonatomic)NSString *is_show;
@property(nonatomic)NSString *comic_theme_id_1;
@property(nonatomic)NSString *comic_theme_id_2;
@property(nonatomic)NSString *comic_theme_id_3;
@property(nonatomic)NSString *comic_type_id;
@property(nonatomic)NSString *painter_user_nickname;
@property(nonatomic)NSString *script_user_nickname;
@property(nonatomic)NSString *comic_pic_516_306;
@property(nonatomic)NSString *comic_pic_720_520;
@property(nonatomic)NSString *comic_pic_240_320;
@property(nonatomic)NSString *comic_pic_300_300;
@property(nonatomic)NSString *user_id;
@property(nonatomic)NSString *comic_last_orderidx;
@property(nonatomic)NSString *comic_isover;

+ (NSArray *)pareRespondData:(NSDictionary *)respondData;
@end
