//
//  ZJMyButton.m
//  ConstructionCaptain
//
//  Created by Jion on 15/11/20.
//  Copyright © 2015年 Youjuke. All rights reserved.
//

#import "ZJMyButton.h"

@implementation ZJMyButton

//重新对同时有图片和文字的button进行布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.contentMode = UIViewContentModeCenter;
    self.imageView.center = CGPointMake(self.bounds.size.width/2.0, self.bounds.size.height/2.0 - self.imageView.image.size.height/2);
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName,self.titleLabel.font,NSFontAttributeName, nil];
    //计算单个字的高度
    CGSize size = [self.titleLabel.text sizeWithAttributes:dic];
    
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.center = CGPointMake(self.bounds.size.width/2.0, self.bounds.size.height/2.0 + size.height*0.8);
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
