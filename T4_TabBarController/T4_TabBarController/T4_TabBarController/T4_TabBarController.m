//
//  MainVCNew.m
//  DaFenBa
//
//  Created by 胡 帅 on 14-9-5.
//  Copyright (c) 2014年 胡 帅. All rights reserved.
//

#import "T4_TabBarController.h"
#import <objc/message.h>
#import "T4_TabBarView.h"

static float kTabSwitchDuration = 0.1;

@implementation T4_TabBarController
{
    UIView *_maskView;//遮挡当前VC层和前个VC层，避免当前VC动画时露出前个VC层
}


@synthesize

tabBar                 = _tabBar,
viewControllers        = _viewControllers,
selectedIndex          = _selectedIndex,
selectedViewController = _selectedViewController;

- (T4_TabBarController *)initWithTabBarHeight:(CGFloat)height andTabIconArr:(NSArray *)iconNames andVCArr:(NSArray *)viewControllers  andBadgeIndex:(int)bageIndex{
    self = [super init];
    if (self) {
        _tabBar                   = [[T4_TabBarView alloc]initWithTabBarHeight:height andTabIconArr:iconNames  andBadgeIndex:bageIndex];
        _tabBar.delegate          = self;
        _maskView                 = [[UIView alloc]initWithFrame:CGRectMake(0, 0,
                                                            [[UIScreen mainScreen]bounds].size.width,
                                                            [[UIScreen mainScreen]bounds].size.width)];
        _maskView.backgroundColor = [UIColor whiteColor];
        _viewControllers          = viewControllers;
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // add childrenViewControllers;
    for (UIViewController *vc in _viewControllers) {
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
        [self addChildViewController:nav];
        // add NavigationController view
        if ([_viewControllers indexOfObject:vc] == 0) {
            [self.view addSubview:nav.view];
        }
    }
    self.view.autoresizesSubviews = NO;
    self.view.autoresizingMask    = UIViewAutoresizingFlexibleHeight;
    // add tabBarView
    CGFloat originY               = self.view.frame.size.height- _tabBar.frame.size.height;
    CGRect tabBarFrame            = CGRectMake(0, originY, _tabBar.frame.size.width, _tabBar.frame.size.height);
    [_tabBar setFrame:tabBarFrame];
    [self.view addSubview:_tabBar];
    _tabBar.delegate = self;
    
    [self setSelectedIndex:0];
}


#pragma mark - T4_TabBarControllerProtocal

- (void)setSelectedIndex:(NSInteger)selectedIndex
{
    if ([self shouldSelectIndex:selectedIndex]) {
        [self.tabBar setSelectedIndex:selectedIndex];
        [self didSelectedIndex:selectedIndex];
    }
}
- (BOOL)shouldSelectIndex:(NSInteger)index
{
    /* uncomment to support conditional switch
    UIViewController *oldVC     = (UIViewController *)self.selectedViewController.topViewController;
    UINavigationController *nav = (UINavigationController *)_viewControllers[index];
    UIViewController *rootVc    = (UIViewController *)(nav.viewControllers[0]);
    switch (index) {
        case 0:
        case 1:
        case 3:
        case 4:
        {
            return YES;
            break;
        }
    }
    return NO;
     */
    return YES;

}
- (void)didSelectedIndex:(NSInteger)index
{
    _selectedIndex = index;
    UIViewController *oldVC = _selectedViewController;
    _selectedViewController = _viewControllers[index];

    _selectedViewController.navigationController.view.frame = CGRectMake(0,0,self.view.frame.size.width, _tabBar.frame.origin.y);
  
    if(oldVC != nil && ![oldVC isEqual:_selectedViewController])//视图发生了更换
    {
        [self.view insertSubview:_maskView belowSubview:_tabBar];//始终保持maskview的所在层次
        [self transitionFromViewController:oldVC.navigationController toViewController:_selectedViewController.navigationController duration:0 options:UIViewAnimationOptionTransitionNone animations:nil completion:nil];
    }
    
}


- (void)hideTabBar
{
    if (_isHidenTabBar)
        return;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:(kTabSwitchDuration)];
    CGRect tabBarFrame   = _tabBar.frame;
    float oldOriginY     = tabBarFrame.origin.y;
    float newOriginY     = oldOriginY + tabBarFrame.size.height;
    tabBarFrame.origin.y = newOriginY;
    [_tabBar setFrame:tabBarFrame];
    CGRect vcFrame       = _selectedViewController.view.frame;
    vcFrame.size.height += _tabBar.frame.size.height;
    [_selectedViewController.navigationController.view setFrame:vcFrame];
    [UIView commitAnimations];
    _isHidenTabBar = YES;
}
- (void)showTabBar
{
    if (!self.isHidenTabBar)
        return;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:(kTabSwitchDuration)];
    CGRect tabBarFrame   = _tabBar.frame;
    float oldOriginY     = tabBarFrame.origin.y;
    float newOriginY     = oldOriginY - tabBarFrame.size.height;
    tabBarFrame.origin.y = newOriginY;
    [_tabBar setFrame:tabBarFrame];
    CGRect vcFrame       = _selectedViewController.navigationController.view.frame;
    vcFrame.size.height -= _tabBar.frame.size.height;
    [_selectedViewController.navigationController.view setFrame:vcFrame];
    [UIView commitAnimations];
    _isHidenTabBar = NO;

}

- (void) setBadge:(NSInteger)value
{
    if (value < 10 && value > 0 ) {
        [_tabBar.badge setText:[NSString stringWithFormat:@" %ld",(long)value]];
    } else {
        [_tabBar.badge setText:@" N"];

    }
}
- (void) clearBadge
{
    [_tabBar.badge setText:@" "];

}


@end
