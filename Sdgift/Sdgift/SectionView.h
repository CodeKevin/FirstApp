//
//  SectionView.h
//  Sdgift
//
//  Created by Kevin on 15/12/4.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SectionView : UICollectionReusableView
@property (weak, nonatomic) IBOutlet UIImageView *signImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *moreBtn;
@end
