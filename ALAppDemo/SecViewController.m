//
//  SecViewController.m
//  ALAppDemo
//
//  Created by Alan on 2017/9/4.
//  Copyright © 2017年 Alan. All rights reserved.
//

#import "SecViewController.h"
#import "UIBarButtonItem+ALAdd.h"
#import "FirstViewController.h"

@interface SecViewController ()

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation SecViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.popGestureIsDisabled = YES;
    self.view.backgroundColor = [UIColor orangeColor];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem rightBarButtonItemWithTitle:@"设置" block:^(id sender) {
        
    }];
    
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"这是第%ld行",indexPath.row + 1];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FirstViewController *fvc = [FirstViewController new];
    [self.navigationController pushViewController:fvc animated:YES];
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
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
