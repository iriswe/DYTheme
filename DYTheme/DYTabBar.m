//
//  DYTabBar.m
//  DYTheme
//
//  Created by ludashen on 2016/12/19.
//  Copyright © 2016年 luge. All rights reserved.
//

#import "DYTabBar.h"
#import "UIView+Frame.h"
#define  DYControllCount 4
@interface DYTabBar ()
@property (nonatomic, strong) UIView *centerBtn;
@end

@implementation DYTabBar


@dynamic delegate;


- (UIView *)centerBtn
{
    if (!_centerBtn) {
        // 添加加好按钮
        UIButton *plusBtn = [[UIButton alloc] init];
        [plusBtn setImage:[[UIImage imageNamed:@"tab_publish_nor"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
        // 设置监听事件
        [plusBtn addTarget:self action:@selector(plusClick) forControlEvents:UIControlEventTouchUpInside];
        self.centerBtn = plusBtn;
        [self addSubview:plusBtn];
    }
    return _centerBtn;
}

- (void)plusClick
{
    if ([self.delegate respondsToSelector:@selector(centerBtnDidClick:)]) {
        [self.delegate centerBtnDidClick:self];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    // 计算宽度
    CGFloat childW = self.width / (DYControllCount + 1);
    self.centerBtn.width = childW;
    self.centerBtn.height = 49;
    
    // 添加plusBtn的位置
    self.centerBtn.x = ([UIScreen mainScreen].bounds.size.width - childW) * 0.5;
    self.centerBtn.y = 0;
    
    // 引出下标
    NSInteger index = 0;
    // 判断是否为控制器按钮
    for (UIView *child in self.subviews) {
        if ([child isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            child.x = index * childW;
            child.width = childW;
            index++;
            if (index == 2) {
                index = 3;
            }
        }
    }
}

+ (instancetype)tabBar
{
    return [[self alloc] init];
}
@end
