//
//  SectionItem.m
//  Sdgift
//
//  Created by Kevin on 15/12/4.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import "SectionItem.h"
#import "RecommendItem.h"
#import "RecomModel.h"
@implementation SectionItem

//- (instancetype)init
//{
//    if (self = [super init]) {
//    
//    }
//    return self;
//}

- (void)awakeFromNib {
    

    UINib *nib = [UINib nibWithNibName:@"RecommendItem" bundle:nil];
    [self.SectionCollectView registerNib:nib forCellWithReuseIdentifier:@"itemId"];
    // Initialization code
}



#pragma mark -
#pragma mark UICollectionViewDelegate


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    RecommendItem *item = [collectionView dequeueReusableCellWithReuseIdentifier:@"itemId" forIndexPath:indexPath];
    RecomModel *model = [self.dataSource objectAtIndex:indexPath.row];
    [item updataWithModel:model];
    return item;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((kScreenW-25)/2.35, 220);
}



@end
