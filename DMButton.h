//
//  DMButton.h
//  iOSAppDemo
//
//  Created by Dianmi iOS 01 on 15/9/14.
//  Copyright (c) 2015年 Dianmi iOS 01. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DMButtonBlock)(UIButton *btn);

@interface DMButton : UIButton

+(DMButton*)btnWithFrame:(CGRect)frame color:(UIColor*)color text:(NSString*)text;
+(DMButton*)btnWithFrame:(CGRect)frame color:(UIColor*)color font:(CGFloat)font text:(NSString*)text;
- (void)DMButtonBlock:(DMButtonBlock)block;

- (void)changeStateNormal;

@end
