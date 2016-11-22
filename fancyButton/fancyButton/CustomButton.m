//
//  CustomButton.m
//  TestButton
//
//  Created by apple on 16/1/3.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CustomButton.h"
#import "Masonry.h"

@implementation CustomButton

- (id)initCustomButton:(NSArray *)options farme:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundColor:[UIColor clearColor]];
        UIView *bgView        = [[UIView alloc] initWithFrame:CGRectZero];
        [self addSubview:bgView];
        UIButton *firstButton = nil;
        UIButton *lastButton  = nil;
        
        for (NSDictionary *option in options) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setBackgroundColor:[option objectForKey:@"color"]];
            [button setTitle:[option objectForKey:@"title"] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal]
            ;
            [[button layer] setCornerRadius:5.0f];
            [[button layer] setMasksToBounds:YES];
            button.titleLabel.font = [UIFont systemFontOfSize:16];
            [bgView addSubview:button];
            
            [button addTarget:self action:@selector(ClickAction:) forControlEvents:UIControlEventTouchUpInside];
            
            CGFloat titleWidth = [[option objectForKey:@"title"] boundingRectWithSize:frame.size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size.width+30;
            if (!firstButton) {
                firstButton = button;
            }
            if (!lastButton) {
                [button mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(bgView.mas_left);
                    make.top.equalTo(bgView.mas_top);
                    make.width.equalTo([NSNumber numberWithDouble:titleWidth]);
                }];
                lastButton  = button;
            } else {
                [button mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(lastButton.mas_right).offset(12);
                    make.top.equalTo(bgView.mas_top);
                    make.width.equalTo([NSNumber numberWithDouble:titleWidth]);
                }];
                lastButton  = button;
            }
        }
        [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.left.equalTo(firstButton.mas_left);
            make.right.equalTo(lastButton.mas_right);
            make.top.and.bottom.equalTo(self);
        }];
    }
    
    return self;
}

- (void)ClickAction:(UIButton *)clickButton
{
    if (_delegate && [_delegate respondsToSelector:@selector(clickButton:)]) {
        [_delegate clickButton:clickButton.titleLabel.text];
    }
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}


@end
