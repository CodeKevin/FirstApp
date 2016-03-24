//
//  RecommendItem.m
//  Sdgift
//
//  Created by Kevin on 15/12/4.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import "RecommendItem.h"

@implementation RecommendItem

- (void)awakeFromNib {
    // Initialization code
}
- (void)updataWithModel:(RecomModel*)model
{
    [self.itemImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.comicq.cn%@",model.comic_pic_240_320]]];
    self.updataLable.text = [NSString stringWithFormat:@"更新至%@话",model.comic_last_orderidx];
    self.nameLabel.text = model.comic_name;
    self.descripLabel.text = model.comic_desc;
    
}
@end
