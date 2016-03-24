//
//  ActiveModel.h
//  Sdgift
//
//  Created by Kevin on 15/12/6.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import "KVBaseModle.h"

@interface ActiveModel : KVBaseModle
/*id": "28",
 "active_name": "人品计算器",
 "active_info": "人品计算器",
 "active_type": "2",
 "rank": "0",
 "active_pic_url_1": "/Public/Images/qingman/active/item/1446617722.jpg",
 "is_show": "1",
 "active_desc_url": */


@property(nonatomic)NSString *id;
@property(nonatomic)NSString *active_name;
@property(nonatomic)NSString *active_info;
@property(nonatomic)NSString *active_type;
@property(nonatomic)NSString *rank;
@property(nonatomic)NSString *active_pic_url_1;
@property(nonatomic)NSString *is_show;
@property(nonatomic)NSString *active_desc_url;

+ (NSArray *)pareRespondData:(NSDictionary *)respondData;

@end
