//
//  KVNewCell.h
//  Sdgift
//
//  Created by Kevin on 15/12/5.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecomModel.h"
@interface KVNewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *KVNewImage;
@property (weak, nonatomic) IBOutlet UILabel *KVNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *KVUpdataLabel;
@property (weak, nonatomic) IBOutlet UILabel *KVDesLabel;


- (void)updateWithModel:(RecomModel*)model;

@end
