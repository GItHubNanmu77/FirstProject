//
//  SenceViewController.m
//  乐行于蜀
//
//  Created by rimi on 16/2/26.
//  Copyright © 2016年 rimi. All rights reserved.
//

#import "SenceViewController.h"
#import "SceneTableViewCell.h"
#import "SceneDetailViewController.h"

@interface SenceViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, copy) NSArray *cell;
@property (nonatomic, copy) NSArray *dataSource;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //初始化数据
    self.dataSource = @[@{@"imageName":@"宽窄巷子.jpg",
                          @"name":@"宽窄巷子",
                          @"phone":@"028-0000-0000",
                          @"address":@"成都市蜀都大道西端金河宾馆北面"},
                        @{@"imageName":@"武侯祠.jpg",
                          @"name":@"武侯祠",
                          @"phone":@"028-0000-0001",
                          @"address":@"四川省成都市南门武侯祠大街"},
                        @{@"imageName":@"锦里.jpg",
                          @"name":@"锦里",
                          @"phone":@"028-0000-0002",
                          @"address":@"成都武侯祠大街中段"},
                        @{@"imageName":@"熊猫基地.jpg",
                          @"name":@"熊猫基地",
                          @"phone":@"028-0000-0003",
                          @"address":@"成都北郊斧头山"},
                        @{@"imageName":@"欢乐谷.jpg",
                          @"name":@"欢乐谷",
                          @"phone":@"028-0000-0004",
                          @"address":@"成都市金牛区西华大道16号"},
                        @{@"imageName":@"杜甫草堂.jpg",
                          @"name":@"杜甫草堂",
                          @"phone":@"028-0000-0005",
                          @"address":@"成都市青华路38号，成都市外西草堂路"}];
    //注册(针对于纯代码或者xib的情况才会注册)
    //    [self.tableView registerClass:[SceneTableViewCell class] forCellReuseIdentifier:@"Scene"];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //重用队列中取出cell
    SceneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Scene" forIndexPath:indexPath];
    //配置cell
    NSDictionary *info = self.dataSource[indexPath.row];
    cell.sceneNameLabel.text = info[@"name"];
    cell.phoneLabel.text = info[@"phone"];
    cell.addressLabel.text = info[@"address"];
    cell.sceneImageView.image = [UIImage imageNamed:info[@"imageName"]];
    
    return cell;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    //取消row的选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    NSLog(@"%ld",indexPath.row);
    //推送
    [self performSegueWithIdentifier:@"SceneDetail" sender:indexPath];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSIndexPath *indexPath = sender;
    NSArray *sceneArray = @[@"宽窄巷子",@"武侯祠",@"锦里",@"熊猫基地",@"欢乐谷",@"杜甫草堂"];
//    NSArray *imageArray = @[@"宽窄巷子2.jpg",@"武侯祠2.jpg",@"锦里.jpg",@"熊猫基地2.jpg",@"欢乐谷3.jpg",@"杜甫草堂1.jpg"];
    NSArray *contentArray = @[@"宽窄巷子.txt", @"武侯祠.txt", @"锦里.txt", @"熊猫基地.txt", @"欢乐谷.txt",@"杜甫草堂.txt"];
    SceneDetailViewController *vc = segue.destinationViewController;
    vc.sceneContent = contentArray[indexPath.row];
//    vc.sceneImageName = imageArray[indexPath.row];
    vc.sceneImageName = sceneArray[indexPath.row];
    
//    SceneDetailViewController *vc = segue.destinationViewController;
//    NSIndexPath *indexPath = sender;
    
//    vc.hidesBottomBarWhenPushed = YES;
//    vc.title = self.dataSource[indexPath.row][@"name"];
//    vc.sceneImageName = self.dataSource[indexPath.row][@"detailImageName"];
//    vc.sceneContent = self.dataSource[indexPath.row][@"sceneDetail"];
}


@end
