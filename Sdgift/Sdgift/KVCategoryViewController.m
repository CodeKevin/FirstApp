//
//  KVCategoryViewController.m
//  Sdgift
//
//  Created by Kevin on 15/12/5.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import "KVCategoryViewController.h"
#import "CategoryItem.h"
#import "categoryModel.h"
#import "CateHeadView.h"
NSString *const ItemId = @"CategoryItemId";
@interface KVCategoryViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic)UICollectionView *collectionView;
@property (nonatomic)NSMutableArray *dataSource;
@end

@implementation KVCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = [NSMutableArray array];
    
    [self createSearchBar];
    [self createCollectionView];
    [self fetchDataFromNet];
    // Do any additional setup after loading the view.
}

- (void)createSearchBar
{
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 30)];
    [self.view addSubview:searchBar];
}
- (void)createCollectionView{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.minimumLineSpacing = 15;
    flowLayout.minimumInteritemSpacing = 15;
    flowLayout.sectionInset = UIEdgeInsetsMake(15, 15, 15, 15);
    flowLayout.itemSize = CGSizeMake((kScreenW-30-30)/3, (kScreenW-30-30)/3);
    //flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    //flowLayout.headerReferenceSize = CGSizeMake(50, 50);
    
    
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 30, kScreenW, kScreenH-64-30) collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    UINib *nib = [UINib nibWithNibName:@"CategoryItem" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:ItemId];
    //注册要使用的HeaverView对应的类型
    
    
    UINib *headNib = [UINib nibWithNibName:@"CateHeadView" bundle:nil];
    
    [_collectionView registerNib:headNib forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"cateViewId"];
    
    [self.view addSubview:self.collectionView];
    
}

- (void)fetchDataFromNet{
    NSString *url = @"http://www.comicq.cn/comic.php?m=QmIosV2x&a=appclass&version=2.3.5&apitime=1449286577";
    [[NetDataEngine sharedInstance] requestCategoryFrom:url success:^(id responsData) {
        
        [self pareResponsData:responsData];
        [self.collectionView reloadData];
        
    } falied:^(NSError *error) {
        NSLog(@"下载失败");
    }];
}
- (void)pareResponsData:(NSArray*)responsData
{
    [self.dataSource addObjectsFromArray:[categoryModel pareRespondData:responsData]];
}
#pragma mark -
#pragma mark UICollectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.dataSource.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.dataSource[section] count];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CategoryItem *item = [collectionView dequeueReusableCellWithReuseIdentifier:ItemId forIndexPath:indexPath];
    categoryModel *model = self.dataSource[indexPath.section][indexPath.row];
    [item.cateImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.comicq.cn%@",model.pic_url]]];
    item.nameLabel.text = model.str_name;
    return item;
}
- (UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if([kind isEqual:UICollectionElementKindSectionHeader])
    {
        
        //指明是头
        CateHeadView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"cateViewId" forIndexPath:indexPath];
        
        if (indexPath.section == 0) {
            headView.nameLabel.text = @"榜单";
        }
        if (indexPath.section == 1) {
             headView.nameLabel.text = @"专题";
        }
        if (indexPath.section == 2) {
            headView.nameLabel.text = @"题材";
        }
        if (indexPath.section == 3) {
            headView.nameLabel.text = @"创作进度";
        }
        headView.backgroundColor = [UIColor whiteColor];
        return headView;
    }
    return nil;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(kScreenW, 30);
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
