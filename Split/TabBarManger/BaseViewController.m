//
//  BaseViewController.m
//  Split
//
//  Created by Jion on 2017/11/22.
//  Copyright © 2017年 Jion. All rights reserved.
//

#import "BaseViewController.h"
#import "BarViewController.h"
#import "Masonry.h"
@interface BaseViewController ()

@end

@implementation BaseViewController
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    if (self.navigationController.childViewControllers.count == 1) {
        BarViewController *rootVC = (BarViewController*)[UIApplication sharedApplication].keyWindow.rootViewController;
        rootVC.barView.hidden = NO;
        __weak typeof(BarViewController*) weakSelf = rootVC;
        [self.navigationController.view mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(weakSelf.view).with.insets(UIEdgeInsetsMake(0, 120, 0, 0));
        }];
        
        
    }
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
