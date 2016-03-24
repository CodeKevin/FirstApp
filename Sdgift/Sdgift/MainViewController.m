//
//  MainViewController.m
//  Sdgift
//
//  Created by Kevin on 15/12/3.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import "MainViewController.h"
#import "Header.h"
#import "CustomNavBar.h"

#import "BaseCollectionViewController.h"
#import "KVCategoryViewController.h"
#import "KVNewViewController.h"
#import "KVActiveViewController.h"

NSString *const kCachedTime = @"kCachedTime";
NSString *const kCachedVCName = @"kCachedVCName";
@interface MainViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic)UICollectionView *contentCollectionView;

@property (nonatomic) NSMutableDictionary *viewControllersCaches;/**< 控制器缓存  */
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    
    UIImageView *mainBgImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainbg"]];
    mainBgImage.frame = self.view.frame;
    [self.view addSubview:mainBgImage];
    
    CustomNavBar *navBarView = [[[NSBundle mainBundle] loadNibNamed:@"CustomNavBar" owner:nil options:nil] lastObject];
    navBarView.frame = CGRectMake(0, 0, kScreenW, 64);
    //navBarView.backgroundColor = [UIColor blackColor];
    //navBarView.alpha = 0.5;
    [navBarView.categoryBtn addTarget:self action:@selector(categoryClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:navBarView];
    
    [self creatCollectionView];
    // Do any additional setup after loading the view.
}
- (void)categoryClick
{
    
}
- (void)creatCollectionView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    layout.itemSize = CGSizeMake(kScreenW, kScreenH-64);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.contentCollectionView  = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, kScreenW, kScreenH-64) collectionViewLayout:layout];
    self.contentCollectionView.pagingEnabled = YES;
    self.contentCollectionView.dataSource = self;
    self.contentCollectionView.bounces = NO;
    self.contentCollectionView.delegate =self;
    self.contentCollectionView.backgroundColor = [UIColor clearColor];
    [self.contentCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"itemId"];
    
     [self.view addSubview:self.contentCollectionView];

}
#pragma mark -
#pragma mark UICollectionViewDelegate


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
}
- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"itemId" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    if (indexPath.row == 0) {
  
        BaseCollectionViewController *cachedViewController = (BaseCollectionViewController*)[self getCachedVCByIndexPath:indexPath];
        if (!cachedViewController) {
    
            cachedViewController = [[BaseCollectionViewController alloc] init];
            [self saveCachedVC:cachedViewController ByIndexPath:indexPath];
        }
        [self addChildViewController:cachedViewController];
        [cell addSubview:cachedViewController.view];
        [cachedViewController didMoveToParentViewController:self];
    }
    if (indexPath.row == 1) {
        KVCategoryViewController *cachedViewController = (KVCategoryViewController*)[self getCachedVCByIndexPath:indexPath];
        if (!cachedViewController) {
            
            cachedViewController = [[KVCategoryViewController alloc] init];
            [self saveCachedVC:cachedViewController ByIndexPath:indexPath];
        }
        [self addChildViewController:cachedViewController];
        [cell addSubview:cachedViewController.view];
        [cachedViewController didMoveToParentViewController:self];
    }
    if (indexPath.row == 2) {
        KVNewViewController *cachedViewController = (KVNewViewController*)[self getCachedVCByIndexPath:indexPath];
        if (!cachedViewController) {
            
            cachedViewController = [[KVNewViewController alloc] init];
            [self saveCachedVC:cachedViewController ByIndexPath:indexPath];
        }
        [self addChildViewController:cachedViewController];
        [cell addSubview:cachedViewController.view];
        [cachedViewController didMoveToParentViewController:self];
    }
    if (indexPath.row == 3) {
        KVActiveViewController *cachedViewController = (KVActiveViewController*)[self getCachedVCByIndexPath:indexPath];
        if (!cachedViewController) {
            
            cachedViewController = [[KVActiveViewController alloc] init];
            [self saveCachedVC:cachedViewController ByIndexPath:indexPath];
        }
        [self addChildViewController:cachedViewController];
        [cell addSubview:cachedViewController.view];
        [cachedViewController didMoveToParentViewController:self];

    }
    
    return cell;
}
#pragma mark -
#pragma 缓存cachedViewController

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    //从缓存中取出instaceController
    UIViewController *cachedViewController = [self getCachedVCByIndexPath:indexPath];
    if (!cachedViewController) {
        return;
    }
    //更新缓存时间
    //[self saveCachedVC:cachedViewController ByIndexPath:indexPath];
    //从父控制器中移除
    [cachedViewController removeFromParentViewController];
    [cachedViewController.view removeFromSuperview];
}
- (UIViewController *)getCachedVCByIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *cachedDic = [self.viewControllersCaches objectForKey:@(indexPath.item)];
    UIViewController *cachedViewController = [cachedDic objectForKey:kCachedVCName];
    return cachedViewController;
}

- (void)saveCachedVC:(UIViewController *)viewController ByIndexPath:(NSIndexPath *)indexPath
{
    // NSDate *newTime =[NSDate date];
    NSDictionary *newCacheDic = @{
                                  kCachedVCName:viewController};
    [self.viewControllersCaches setObject:newCacheDic forKey:@(indexPath.item)];
}
- (NSMutableDictionary *)viewControllersCaches
{
    if (!_viewControllersCaches) {
        _viewControllersCaches = [NSMutableDictionary dictionaryWithCapacity:0];
    }
    return _viewControllersCaches;
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
