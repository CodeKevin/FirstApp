//
//  SectionItem.h
//  Sdgift
//
//  Created by Kevin on 15/12/4.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SectionItem : UICollectionViewCell<UICollectionViewDataSource,UICollectionViewDelegate>

@property (strong, nonatomic) IBOutlet UICollectionView *SectionCollectView;
@property(nonatomic)NSMutableArray *dataSource;
@end
