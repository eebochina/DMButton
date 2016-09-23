//
//  DMButton.m
//  iOSAppDemo
//
//  Created by Dianmi iOS 01 on 15/9/14.
//  Copyright (c) 2015年 Dianmi iOS 01. All rights reserved.
//

#import "DMButton.h"


@interface DMButton()

@property (nonatomic, strong)DMButtonBlock myBlock;
@property (nonatomic, strong)UIView *backView;
@property (nonatomic, strong)UIActivityIndicatorView* act;

@end

@implementation DMButton

+(DMButton*)btnWithFrame:(CGRect)frame color:(UIColor*)color text:(NSString*)text
{
    DMButton*btn = [DMButton buttonWithType:UIButtonTypeCustom];
    btn.layer.cornerRadius = 5;
    btn.layer.masksToBounds = YES;
    [btn setBackgroundColor:color];
    [btn setTitle:text forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setFrame:frame];
    btn.titleLabel.font = [UIFont systemFontOfSize:20];
    return btn;
}

+(DMButton*)btnWithFrame:(CGRect)frame color:(UIColor*)color font:(CGFloat)font text:(NSString*)text
{
    DMButton *btn = [DMButton btnWithFrame:frame color:color text:text];
    btn.titleLabel.font = [UIFont systemFontOfSize:font];
    return btn;
}

- (void)DMButtonBlock:(DMButtonBlock)block{
    
    self.myBlock = block;
    [self addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
  
    _backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    _backView.backgroundColor = [UIColor whiteColor];
    _backView.alpha = 0;
    [self addSubview:_backView];
    
    _act = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.width)];
    _act.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
    _act.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    [self addSubview:_act];
}

- (void)btnAction{
    
    if (self.userInteractionEnabled == YES) {
        self.userInteractionEnabled = NO;
        self.titleLabel.alpha = 0;
        [UIView animateWithDuration:0.3 animations:^{
            _backView.alpha = 0.5;
        }];
        [_act startAnimating];
        _myBlock(self);
    }
}

- (void)changeStateNormal{
    [_act stopAnimating];
     self.titleLabel.alpha = 1;
    [UIView animateWithDuration:0.3 animations:^{
        _backView.alpha = 0;
    }];
    self.userInteractionEnabled = YES;
}

//获取颜色
- (UIColor *)getColor:(NSString *)hexColor
{
    unsigned int red,green,blue;
    NSRange range;
    range.length = 2;
    
    range.location = 0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
    
    range.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
    
    range.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green / 255.0f) blue:(float)(blue / 255.0f) alpha:1.0f];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
-(void)dealloc
{
    self.myBlock = nil;
    self.backView = nil;
}
@end
