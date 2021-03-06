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
        [UIView animateWithDuration:0.3 animations:^{
            [self.navigationController.view mas_updateConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(weakSelf.view).with.insets(UIEdgeInsetsMake(0, 120, 0, 0));
            }];
            
            [self.navigationController.view.superview layoutIfNeeded];
        }];
        
        
    }
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//跳转到根视图控制器
- (void)dismissToRootViewControllerAnimated: (BOOL)flag completion: (void (^ __nullable)(void))completion
{
    UIViewController * presentingViewController = self.presentingViewController;
    while (presentingViewController.presentingViewController) {
        presentingViewController = presentingViewController.presentingViewController;
    }
    [presentingViewController dismissViewControllerAnimated:flag completion:^{
        completion();
    }];
}
//跳转到指定的控制器
- (void)dismissToViewController:(NSString *)viewController animated: (BOOL)flag completion: (void (^ __nullable)(void))completion {
    
    UIViewController * presentingViewController = self.presentingViewController;
    do {
        if ([presentingViewController isKindOfClass:NSClassFromString(viewController)]) {
            break;
        }
        presentingViewController = presentingViewController.presentingViewController;
        
    } while (presentingViewController.presentingViewController);
    
    [presentingViewController dismissViewControllerAnimated:flag completion:^{
        completion();
    }];
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
