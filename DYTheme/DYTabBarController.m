//
//  DYTabBarController.m
//  DYTheme
//
//  Created by ludashen on 2016/12/19.
//  Copyright © 2016年 luge. All rights reserved.
//

#import "DYTabBarController.h"
#import "DYTabBar.h"
#import "DYNavigationController.h"
#import "DYCollectionViewController.h"

@interface DYTabBarController () <DYTabBarDelegate>

@end

@implementation DYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setValue:[DYTabBar tabBar] forKeyPath:@"tabBar"];
    
    [self addChildViewController:[[DYCollectionViewController alloc] init] image:@"tab_home_nor" selectedImage:@"tab_home_press" title:@"Home"];
    [self addChildViewController:[[DYCollectionViewController alloc] init] image:@"tab_classify_nor"  selectedImage:@"tab_classify_press"  title:@"Classify"];
    [self addChildViewController:[[DYCollectionViewController alloc] init] image:@"tab_community_nor"  selectedImage:@"tab_community_press"  title:@"Community"];
    [self addChildViewController:[[DYCollectionViewController alloc] init] image:@"tab_me_nor"  selectedImage:@"tab_me_press"  title:@"Me"];
}

- (void)centerBtnDidClick:(DYTabBar *)tabBar
{
    NSLog(@"点击中间的btn");
}

- (void)addChildViewController:(UIViewController *)childController image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title
{
    childController.title = title;
    
    [childController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]} forState:UIControlStateNormal];
    
    [childController.tabBarItem setImage:[[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [childController.tabBarItem setSelectedImage:[[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    
    DYNavigationController *nvc = [[DYNavigationController alloc] initWithRootViewController:childController];
    [self addChildViewController:nvc];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
