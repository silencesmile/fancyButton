//
//  CustomButton.h
//  TestButton
//
//  Created by apple on 16/1/3.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CustomButtonDelegate <NSObject>
- (void)clickButton:(NSString *)title;
@end

@interface CustomButton : UIView
@property (nonatomic, weak)id <CustomButtonDelegate>delegate;

- (id)initCustomButton:(NSArray *)options farme:(CGRect)frame;
@end
