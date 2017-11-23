//
//  ViewController3.m
//  Split
//
//  Created by Jion on 2017/11/22.
//  Copyright © 2017年 Jion. All rights reserved.
//

#import "ViewController3.h"

@interface ViewController3 ()

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"3";
    self.view.backgroundColor = [UIColor purpleColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.bounds = CGRectMake(100, 100, 40,40);
    btn.backgroundColor = [UIColor whiteColor];
    btn.center = self.view.center;
    [btn addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.translatesAutoresizingMaskIntoConstraints = NO;
    [btn1 setTitle:@"x" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(action1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[btn(40)]-20-|" options:0 metrics:nil views:@{@"btn":btn1}]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[btn(40)]" options:0 metrics:nil views:@{@"btn":btn1}]];
}

-(void)action{
    ViewController3 *vc3 = [[ViewController3 alloc] init];
    [self presentViewController:vc3 animated:YES completion:^{}];
    
}
-(void)action1{
    [self dismissViewControllerAnimated:YES completion:^{
        
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
