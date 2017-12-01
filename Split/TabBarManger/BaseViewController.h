//
//  BaseViewController.h
//  Split
//
//  Created by Jion on 2017/11/22.
//  Copyright © 2017年 Jion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

NS_ASSUME_NONNULL_BEGIN

#define randColor [UIColor colorWithHue:( arc4random() % 256 / 256.0 ) saturation:( arc4random() % 128 / 256.0 ) + 0.5 brightness:( arc4random() % 128 / 256.0 ) + 0.5 alpha:1]

@interface BaseViewController : UIViewController

//跳转到根视图控制器
- (void)dismissToRootControllerAnimated: (BOOL)flag completion: (void (^__nullable)(void))completion;
//跳转到指定的控制器
- (void)dismissToController:(NSString *)viewController animated: (BOOL)flag completion: (void (^__nullable)(void))completion;

@end

NS_ASSUME_NONNULL_END
