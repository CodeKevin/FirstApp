//
//  KVActiveViewController.m
//  Sdgift
//
//  Created by Kevin on 15/12/6.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import "KVActiveViewController.h"
#import "ActiveCell.h"
#import "ActiveModel.h"
#import "UIImageView+WebCache.h"
@interface KVActiveViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic)UITableView *tableView;
@property(nonatomic)NSMutableArray *dataSource;

@end

@implementation KVActiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [NSMutableArray array];
    [self createTableView];
    [self fetchNetFromServer];
    // Do any additional setup after loading the view.
}

- (void)createTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH - 64)];
    self.tableView.rowHeight = (kScreenH-64)/3;
    
    UINib *nib = [UINib nibWithNibName:@"ActiveCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"activeId"];
    
    self.tableView.separatorStyle =  UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
}


- (void)fetchNetFromServer
{
    NSString *url = @"http://www.comicq.cn/comic.php?m=QmIosV2x&a=comicactive&version=2.3.5&apitime=1449286577&sign=a516621e69c71ea48a680d4a60742e49";
    [[NetDataEngine sharedInstance] requestActiveList:url success:^(id responsData) {
        
        [self pareResponsData:responsData];
        [self.tableView reloadData];
        
    } falied:^(NSError *error) {
        NSLog(@"下载失败");
    }];
    
}
- (void)pareResponsData:(NSDictionary*)responsData
{
    
    [self.dataSource addObjectsFromArray:[ActiveModel pareRespondData:responsData]];
}
#pragma mark
#pragma mark tableViewDelegate



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
    //return self.dataSource.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ActiveCell *cell = [tableView dequeueReusableCellWithIdentifier:@"activeId" forIndexPath:indexPath];
    ActiveModel *model = [self.dataSource objectAtIndex:indexPath.row];
    
    [cell.ActiveImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.comicq.cn%@",model.active_pic_url_1]]];

    cell.NameLabel.text = model.active_name;
    return cell;
    
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
