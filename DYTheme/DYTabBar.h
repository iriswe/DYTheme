//
//  DYTabBar.h
//  DYTheme
//
//  Created by ludashen on 2016/12/19.
//  Copyright © 2016年 luge. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DYTabBar;
@protocol DYTabBarDelegate <UITabBarDelegate>

@optional
- (void)centerBtnDidClick:(DYTabBar *)tabBar;
@end

@interface DYTabBar : UITabBar


@property (weak, nonatomic) id<DYTabBarDelegate> delegate;

+ (instancetype)tabBar;

@end
