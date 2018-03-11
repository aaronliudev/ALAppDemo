//
//  ViewController.m
//  ALAppDemo
//
//  Created by Alan on 2017/8/28.
//  Copyright © 2017年 Alan. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)buttonClick:(id)sender
{
    FirstViewController *firstVc = [[FirstViewController alloc] init];
    UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:firstVc];
    [self presentViewController:navc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
