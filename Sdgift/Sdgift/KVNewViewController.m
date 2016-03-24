//
//  KVNewViewController.m
//  Sdgift
//
//  Created by Kevin on 15/12/5.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import "KVNewViewController.h"
#import "KVNewCell.h"
#import "NewModel.h"
@interface KVNewViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic)UITableView *tableView;
@property(nonatomic)NSMutableArray *dataSource;
@end

@implementation KVNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [NSMutableArray array];
    [self createTableView];
    [self fetchNetFromServer];
    // Do any additional setup after loading the view.
}

- (void)createTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH - 64) style:UITableViewStylePlain];
    self.tableView.rowHeight = 200;
    
    UINib *nib = [UINib nibWithNibName:@"KVNewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"newId"];
    
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
}
- (void)fetchNetFromServer
{
    NSString *url = @"http://www.comicq.cn/comic.php?m=QmIosV2x&a=comictimeline&version=2.3.5&apitime=1449285635&isfirst=1";
    [[NetDataEngine sharedInstance] requestCategoryFrom:url success:^(id responsData) {
        
        [self pareResponsData:responsData];
        [self.tableView reloadData];
        
    } falied:^(NSError *error) {
        NSLog(@"下载失败");
    }];

}
- (void)pareResponsData:(NSDictionary*)responsData
{
    [self.dataSource addObjectsFromArray:[NewModel pareRespondData:responsData]];
}
#pragma mark
#pragma mark tableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NewModel *model = self.dataSource[section];
    return model.comic_arr.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    KVNewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newId" forIndexPath:indexPath];
    
    NewModel *model = self.dataSource[indexPath.section];
    RecomModel *recomModel = [[RecomModel alloc] init];
    [recomModel setValuesForKeysWithDictionary:model.comic_arr[indexPath.row]];
    [cell updateWithModel:recomModel];
    
    return cell;
    
}
- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NewModel *model = self.dataSource[section];
    return model.show_time;
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
