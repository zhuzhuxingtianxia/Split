//
//  ViewController1.m
//  Split
//
//  Created by Jion on 2017/11/22.
//  Copyright © 2017年 Jion. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"1";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createRightItem];
    
    [self scollLayout_View1];
    
    [self scollLayout_View2];
    
    [self scollLayout_View3];
}

-(void)scollLayout_View1{
    UIScrollView *scroll = [UIScrollView new];
    scroll.alwaysBounceVertical = YES;
    scroll.backgroundColor = randColor;
    [self.view addSubview:scroll];
    
    [scroll mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.equalTo(self.view).with.offset(10);
        make.right.equalTo(self.view).with.offset(-10);
        make.height.mas_equalTo(@100);
    }];
    
    UIView *contentView = [UIView new];
    contentView.backgroundColor = randColor;
    [scroll addSubview:contentView];
    
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scroll).with.insets(UIEdgeInsetsMake(5, 5, 5, 5));
        make.width.equalTo(scroll).with.offset(-10);
        make.height.equalTo(scroll).with.offset(-10);
    }];
    
}

-(void)scollLayout_View2{
    UIScrollView *scroll = [UIScrollView new];
    scroll.alwaysBounceHorizontal = YES;
    scroll.backgroundColor = randColor;
    [self.view addSubview:scroll];
    
    [scroll mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(10);
        make.top.equalTo(self.view).with.offset(150);
        make.right.equalTo(self.view).with.offset(-10);
        make.height.mas_equalTo(@100);
    }];
    
    UIView *contentView = [UIView new];
    contentView.backgroundColor = randColor;
    [scroll addSubview:contentView];
    
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scroll).with.insets(UIEdgeInsetsMake(5, 5, 5, 5));
        make.height.equalTo(scroll).with.offset(-10);
    }];
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger k = 0; k < 10; k++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = randColor;
        [button setTitle:[NSString stringWithFormat:@"%ld",k] forState:UIControlStateNormal];
        button.tag = k;
        [button addTarget:self action:@selector(alertTile:) forControlEvents:UIControlEventTouchUpInside];
        [contentView addSubview:button];
        
        [array addObject:button];
        
    }
    
    [array mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:10 leadSpacing:10 tailSpacing:10];
    [array mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(contentView).with.offset(5);
        make.bottom.equalTo(contentView).with.offset(-5);
        make.width.mas_equalTo(@140);
    }];
    
}

-(void)alertTile:(UIButton*)sender{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%ld",sender.tag] message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    
    [alert show];
}

-(void)action{
    ViewController1 *vc1 = [[ViewController1 alloc] init];
    
    [self.navigationController pushViewController:vc1 animated:YES];
}

-(void)scollLayout_View3{
    //九宫格
    
    UIScrollView *scroll = [UIScrollView new];
    scroll.alwaysBounceHorizontal = YES;
    scroll.backgroundColor = randColor;
    [self.view addSubview:scroll];
    
    [scroll mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(10);
        make.top.equalTo(self.view).with.offset(300);
        make.right.equalTo(self.view).with.offset(-10);
        make.height.mas_equalTo(@100);
    }];
    
    UIView *contentView = [UIView new];
    contentView.backgroundColor = randColor;
    [scroll addSubview:contentView];
    
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scroll).with.insets(UIEdgeInsetsMake(5, 5, 5, 5));
        make.height.equalTo(scroll).with.offset(-10);
    }];
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger k = 0; k < 10; k++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = randColor;
        [button setTitle:[NSString stringWithFormat:@"%ld",k] forState:UIControlStateNormal];
        button.tag = k;
        [button addTarget:self action:@selector(alertTile:) forControlEvents:UIControlEventTouchUpInside];
        [contentView addSubview:button];
        
        [array addObject:button];
        
    }
    
    [array mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:10 leadSpacing:10 tailSpacing:10];
    [array mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(contentView).with.offset(5);
        make.bottom.equalTo(contentView).with.offset(-5);
        make.width.mas_equalTo(@140);
    }];
    
}


-(void)createRightItem{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 100, 40,40);
    [btn setTitle:@"push" forState:UIControlStateNormal];
    [btn setTitleColor:randColor forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItems = @[item];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
