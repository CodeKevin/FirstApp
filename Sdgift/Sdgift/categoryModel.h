//
//  categoryModel.h
//  Sdgift
//
//  Created by Kevin on 15/12/5.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import "KVBaseModle.h"

@interface categoryModel : KVBaseModle

@property(nonatomic)NSString *id;
@property(nonatomic)NSString *str_name;
@property(nonatomic)NSString *tbl_tag;
@property(nonatomic)NSString *pic_url;
@property(nonatomic)NSString *is_show;
@property(nonatomic)NSString *progress_value;

+ (NSArray *)pareRespondData:(NSArray *)respondData;
@end
