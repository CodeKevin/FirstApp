//
//  KVNewCell.m
//  Sdgift
//
//  Created by Kevin on 15/12/5.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import "KVNewCell.h"
#import "RecomModel.h"
@implementation KVNewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)updateWithModel:(RecomModel*)model
{
    [self.KVNewImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.comicq.cn%@",model.comic_pic_240_320]]];
    self.KVNameLabel.text = model.comic_name;
    self.KVUpdataLabel.text = [NSString stringWithFormat:@"更新至%@话",model.comic_last_orderidx];
    self.KVDesLabel.text = model.comic_desc;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
