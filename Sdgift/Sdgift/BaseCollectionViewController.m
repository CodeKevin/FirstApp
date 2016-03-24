//
//  BaseCollectionViewController.m
//  goodthings
//
//  Created by qianfeng007 on 15/10/12.
//  Copyright (c) 2015年 LiGuohuai. All rights reserved.
//
#define ItemId @"itemIdSection"

#import "BaseCollectionViewController.h"
#import "RecommendItem.h"
#import "SectionItem.h"
#import "SectionView.h"
@interface BaseCollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic)UICollectionView *collectionView;
@property (nonatomic)NSInteger pages;

@property(nonatomic)NSMutableArray *TotalDataSource;
@end

@implementation BaseCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pages = 1;
    self.TotalDataSource = [NSMutableArray array];
    [self creatCollectionView];
    [self fetchDataFromNet];
       
    
}
- (void)creatCollectionView{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    flowLayout.itemSize = CGSizeMake(kScreenW,220);
    flowLayout.headerReferenceSize = CGSizeMake(50, 50);
    
    
    
   // flowLayout.sectionInset = UIEdgeInsetsMake(15, 15, 15, 15);
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH-64) collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.bounces = NO;
    
    UINib *nib = [UINib nibWithNibName:@"SectionItem" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:ItemId];
    //注册要使用的HeaverView对应的类型
    
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeadViewIdFirst"];
    
    UINib *headNib = [UINib nibWithNibName:@"SectionView" bundle:nil];
    
    [_collectionView registerNib:headNib forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeadViewId"];

    
    [self.view addSubview:self.collectionView];
    
}

- (void)fetchDataFromNet{
    NSString *url = @"http://www.comicq.cn/comic.php?m=QmIosV2x&a=appindex&version=2.3.5&apitime=1449285635";
    [[NetDataEngine sharedInstance] requestRecommendFrom:url success:^(id responsData) {
        
        [self pareResponsData:responsData];
        [self.collectionView reloadData];
        
    } falied:^(NSError *error) {
        NSLog(@"下载失败");
    }];
}
- (void)pareResponsData:(NSDictionary*)responsData
{
    [self.TotalDataSource addObjectsFromArray:[RecomModel pareRespondData:responsData]];
    NSLog(@"%@",self.TotalDataSource);
}
#pragma mark -
#pragma mark UICollectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.TotalDataSource.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
   return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SectionItem *item = [collectionView dequeueReusableCellWithReuseIdentifier:ItemId forIndexPath:indexPath];
    
    item.dataSource = [self.TotalDataSource objectAtIndex:indexPath.section];
    //[item.SectionCollectView reloadData];
    return item;
}
- (UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        UICollectionReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeadViewIdFirst" forIndexPath:indexPath];
        headView.backgroundColor = [UIColor clearColor];
        return headView;
    }
    if([kind isEqual:UICollectionElementKindSectionHeader])
    {
      
        //指明是头
        SectionView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeadViewId" forIndexPath:indexPath];
        if (indexPath.section == 1) {
            headView.nameLabel.text = @"最新作品";
        }
        if (indexPath.section == 2) {
            headView.nameLabel.text = @"人气作品";
        }
        if (indexPath.section ==3) {
            headView.nameLabel.text = @"猜你喜欢";
            headView.moreBtn.hidden = YES;
        }

        headView.backgroundColor = [UIColor whiteColor];
        return headView;
    }
//    if ([kind isEqual:UICollectionElementKindSectionFooter]) {
//        UICollectionReusableView *footView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footViewId" forIndexPath:indexPath];
//        footView.backgroundColor = [UIColor blueColor];
//        return footView;
//    }
    
    return nil;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return CGSizeMake(kScreenW, (kScreenH-64)/2);
    }
    return CGSizeMake(kScreenW, 50);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
