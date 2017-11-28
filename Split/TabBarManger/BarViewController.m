//
//  ViewController.m
//  Split
//
//  Created by Jion on 2017/11/22.
//  Copyright © 2017年 Jion. All rights reserved.
//

#import "BarViewController.h"
#import "Masonry.h"
#import "ZJNavigationController.h"
#import "ZJMyButton.h"
#define splitBarW 120.0

@interface BarViewController ()
{
    NSUInteger _cout;
}
@property(nonatomic,strong)NSMutableArray *buttons;
@property(nonatomic,strong)ZJMyButton *selectBtn;
@end

@implementation BarViewController
-(instancetype)init{
    self = [super init];
    if (self) {
        //设置选中
        _selectIndex = 0;
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置选中
    _selectIndex = 1;
    [self setUp];
}

-(void)setSelectIndex:(NSInteger)selectIndex{
    _selectIndex = selectIndex;
    if (_selectIndex > 0) {
        ZJMyButton *btn = _buttons[_selectIndex];
        [self selectItem:btn];
    }
}


-(void)setUp{
    
    [self.view addSubview:self.barView];
    
    NSArray *controllers = @[@"ViewController1",@"ViewController2",@"ViewController3",@"ViewController4",@"ViewController5"];
    
    [self createControllers:controllers];
    
    NSArray *titles = @[@"首页",@"定制中心",@"四大优势",@"真实案例",@"双重保障"];
    NSArray *imageArray = @[@"home1",@"dingzhi1",@"youshi1",@"case1",@"safe1"];
    NSArray *imageSelectArray =@[@"home1",@"dingzhi2",@"youshi2",@"case2",@"safe1"];
    
    [self setupTitles:titles imgs:imageArray selectImgs:imageSelectArray];
    
    [self lastEvent:@"我要定制"];
}

-(void)createControllers:(NSArray*)controllers{
    _cout = controllers.count;
    for (NSInteger j = controllers.count - 1; j >= 0; j--) {
        NSString *className = controllers[j];
        UIViewController *vc = [[NSClassFromString(className) alloc] init];
        ZJNavigationController *nav = [[ZJNavigationController alloc] initWithRootViewController:vc];
        [self addChildViewController:nav];
        [self.view addSubview:nav.view];
        __weak typeof(self) weakSelf = self;
        [nav.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(weakSelf.view).with.insets(UIEdgeInsetsMake(0, splitBarW, 0, 0));
        }];
    }
}

-(void)setupTitles:(NSArray *)titles imgs:(NSArray*)imgs selectImgs:(NSArray*)selectImgs{
   
    __weak typeof(self) weakSlef = self;
    [self.barView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.and.bottom.equalTo(weakSlef.view);
        make.width.mas_equalTo(@(splitBarW));
    }];
    if (!self.buttons) {
        NSMutableArray *buttons= [NSMutableArray arrayWithCapacity:titles.count];
        self.buttons = buttons;
    }
    for (NSInteger k=0; k<titles.count; k++) {
        ZJMyButton *button = [ZJMyButton buttonWithType:UIButtonTypeCustom];
        button.tag = k;
        [button setTitle:titles[k] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [button setTitleColor:[UIColor colorWithRed:0/255.0 green:194/255.0 blue:79/255.0 alpha:1.0] forState:UIControlStateSelected];
        
        [button setImage:[UIImage imageNamed:imgs[k]] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:selectImgs[k]] forState:UIControlStateSelected];
        
        [button addTarget:self action:@selector(selectItem:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.barView addSubview:button];
        if (k == 0) {
            button.selected = YES;
            _selectBtn = button;
        }
        if (button.selected) {
            button.backgroundColor = [UIColor colorWithRed:202/255.0 green:239/25.0 blue:219/255.0 alpha:1.0];
        }
        [_buttons addObject:button];
    }
    
    if (_selectIndex > 0) {
        ZJMyButton *btn = _buttons[_selectIndex];
        [self selectItem:btn];
    }
    
    [_buttons mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:0 leadSpacing:40 tailSpacing:2*splitBarW];
   
    [_buttons mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@0);
        make.trailing.equalTo(@0);
    }];
    /*
    for (NSInteger k=0; k<buttons.count; k++) {
        UIView *subView = buttons[k];
        [subView.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-a-[subView(80)]" options:0 metrics:@{@"a":@(60+110*k)} views:NSDictionaryOfVariableBindings(subView)]];
        
    }
    */
}

-(void)lastEvent:(NSString*)title{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.tag = 100;
    
    button.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    button.titleLabel.numberOfLines = 2;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:24/255.0 green:176/255.0 blue:88/255.0 alpha:1.0] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor whiteColor];
    button.layer.cornerRadius = (splitBarW-40)/2;
    button.layer.borderWidth = 3.0;
    button.layer.borderColor = [UIColor colorWithRed:14.0/255 green:139.0/255 blue:66.0/255 alpha:1.0].CGColor;
    button.layer.masksToBounds = YES;
    [button addTarget:self action:@selector(lastSelectItem:) forControlEvents:UIControlEventTouchUpInside];
    [self.barView addSubview:button];
    
    __weak typeof(self) weakSlef = self;
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(weakSlef.barView).with.offset(20);
        make.trailing.equalTo(weakSlef.barView).with.offset(-20);
        make.bottom.equalTo(weakSlef.barView).with.offset(-splitBarW/2);
        make.width.and.height.mas_equalTo(splitBarW-40);
    }];
}

#pragma mark -- Action
-(void)selectItem:(ZJMyButton*)sender{
    if (sender == _selectBtn) return;
    _selectBtn.selected = !_selectBtn.selected;
    if ( _selectBtn.selected) {
         _selectBtn.backgroundColor = [UIColor colorWithRed:202/255.0 green:239/25.0 blue:219/255.0 alpha:1.0];
    }else{
         _selectBtn.backgroundColor = [UIColor clearColor];
    }
    
    sender.selected = !sender.selected;
    _selectBtn = sender;
    if (sender.selected) {
        sender.backgroundColor = [UIColor colorWithRed:202/255.0 green:239/25.0 blue:219/255.0 alpha:1.0];
    }else{
        sender.backgroundColor = [UIColor clearColor];
    }
    
   NSArray *childViewControllers = self.childViewControllers;
    UIViewController *vc = childViewControllers[_cout - sender.tag - 1];
    self.currentIndex = _cout - sender.tag - 1;
    [self.view addSubview:vc.view];
    
}

-(void)lastSelectItem:(ZJMyButton*)sender{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"定制" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
    [alert show];
}

#pragma mark -- getter
-(UIView*)barView{
    if (!_barView) {
        _barView = [UIView new];
        _barView.backgroundColor = [UIColor colorWithRed:24/255.0 green:176/255.0 blue:88/255.0 alpha:1.0];
        
    }
    return  _barView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
