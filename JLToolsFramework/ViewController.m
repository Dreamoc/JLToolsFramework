//
//  ViewController.m
//  JLToolsFramework
//
//  Created by Dreamoc on 2020/12/1.
// 123-打包-修复bug

#import "ViewController.h"
#import "JLMoveViewController.h"
#import "JLBezierViewController.h"
#import "JLToolsFramework-Swift.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView * myTableView;
@property (nonatomic, strong) NSArray * dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    [self loadData];
}

- (void)setupUI {
    self.myTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.myTableView.backgroundColor = [UIColor whiteColor];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.tableFooterView = [UIView new];
    self.myTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:self.myTableView];
}

#pragma mark TableViewDelegate TableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView  {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    Class class = self.dataArray[indexPath.row];
    cell.textLabel.text = NSStringFromClass(class);
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Class class = self.dataArray[indexPath.row];
    UIViewController  * vc = [[class alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)loadData {
    self.dataArray = @[[JLMoveViewController class],[JLBezierViewController class],[JLRecorderViewController class],[JLSwiftTestViewController class]];
    [self.myTableView reloadData];
    MyInfo3 *info3 = [[MyInfo3 alloc]initWithName:@"400" age:400];
    
}

@end
