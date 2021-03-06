//
//  ISSNavigationController.m
//  SmartBuildingSite
//
//  Created by XT Xiong on 2017/10/10.
//  Copyright © 2017年 iSoftStone. All rights reserved.
//

#import "ISSNavigationController.h"

@interface ISSNavigationController ()

@end

@implementation ISSNavigationController

-(void)viewWillAppear:(BOOL)animated
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.viewControllerStach = [NSMutableArray array];
//    [self.navigationBar addSubview:self.bottomLine];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)replaceCurrentControllerWithController:(UIViewController *)vc{
    [self popViewControllerAnimated:NO];
    [self pushViewController:vc animated:YES];
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated whetherJump:(BOOL)jumped{
    
    if (!jumped) {
        [self.viewControllerStach addObject:self.topViewController];
    }
    [super pushViewController:viewController animated:animated];
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    [self pushViewController:viewController animated:animated whetherJump:NO];
}


- (nullable UIViewController *)popViewControllerAnimated:(BOOL)animated{
    if (self.viewControllerStach.count == 0) {
        return [super popViewControllerAnimated:animated];
    }
    
    NSArray *array = [self popToViewController:[self.viewControllerStach lastObject] animated:animated];
    
    return [array lastObject];
}

- (nullable NSArray<__kindof UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated{
    NSArray *arr = [super popToViewController:viewController animated:animated];
    
    if ([self.viewControllerStach containsObject:viewController]) {
        NSInteger index = [self.viewControllerStach indexOfObject:viewController];
        [self.viewControllerStach removeObjectsInRange:NSMakeRange(index, self.viewControllerStach.count-index)];
    }else{
        [self.viewControllerStach removeObjectsInArray:arr];
        [self.viewControllerStach removeLastObject];
    }
    
    return arr;
}


- (nullable NSArray<__kindof UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated{
    [self.viewControllerStach removeAllObjects];
    return [super popToRootViewControllerAnimated:animated];
}

- (UIView *)bottomLine
{
    if (_bottomLine == nil) {
        _bottomLine = [[UIView alloc]initWithFrame:CGRectMake(0, kNavigationBarHeight-0.5, kScreenWidth, 0.5)];
        _bottomLine.backgroundColor = ISSColorSeparatorLine;
    }
    return _bottomLine;
}
@end
