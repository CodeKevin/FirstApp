//
//  RecommendItem.h
//  Sdgift
//
//  Created by Kevin on 15/12/4.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecomModel.h"
@interface RecommendItem : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *itemImage;
@property (weak, nonatomic) IBOutlet UILabel *updataLable;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descripLabel;

- (void)updataWithModel:(RecomModel*)model;
@end
