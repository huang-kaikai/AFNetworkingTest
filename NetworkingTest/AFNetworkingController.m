//
//  AFNetworkingController.m
//  NetworkingTest
//
//  Created by ryan.huang on 2020/4/24.
//  Copyright © 2020 ryan.huang. All rights reserved.
//

#import "AFNetworkingController.h"
#import <AFNetworking.h>

@interface AFNetworkingController () <UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) NSArray *dataSource;

@end

@implementation AFNetworkingController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"AFNetworking";
    
    [self showTableView];
    
    self.dataSource = @[@"好吃的食物",@"好玩的遊戲",@"PS4",@"Switch",@"集合吧！動物森友會"];
    
    [self getAFN];
}

-(void)showTableView {
    self.tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] bounds] style:UITableViewStylePlain];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

#pragma mark - 網絡請求設置

- (void)getAFN {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    NSString *url = @"https://route.showapi.com/126-1";

    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            // 请求进度

         }
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

             NSLog(@"请求成功：%@",responseObject);

         }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull   error) {

             NSLog(@"请求失败：%@",error);

         }];
}








#pragma mark - TableView 設置

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [_dataSource objectAtIndex:indexPath.row];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //cell最右邊的顯示type
    
    cell.contentView.backgroundColor = [UIColor clearColor]; //cell的顏色
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
