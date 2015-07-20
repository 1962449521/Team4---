/*!
 @header MainVC.h
 @abstract 主界面 自定义taBarController,遵循MainModuleDelegate协议
 @author 胡帅
 @version 1.0 2014/08 Creation
 
 -------------------------------------
 revised by 胡 帅 on 2015/07/20
 

 */

#import <UIKit/UIKit.h>
#import "T4_TabBarControllerProtocal.h"

@class T4_TabBarView;

@interface T4_TabBarController:UIViewController <T4_TabBarControllerProtocal>
// properties and methods comments reference T4_TabBarControllerProtocal.h

@property (nonatomic, strong          ) T4_TabBarView          *tabBar;
@property (nonatomic, assign          ) NSInteger              selectedIndex;
@property (nonatomic, weak, readonly  ) UINavigationController *selectedViewController;
@property (nonatomic, strong          ) NSArray                *viewControllers;
@property (nonatomic, assign, readonly) BOOL                   isHidenTabBar;

- (T4_TabBarController *)initWithTabBarHeight:(CGFloat)height andTabIconArr:(NSArray *)iconNames andVCArr:(NSArray *)viewControllers andBadgeIndex:(int)bageIndex;
- (void)setSelectedIndex:(NSInteger)selectedIndex;
- (BOOL) shouldSelectIndex:(NSInteger)index;
- (void) didSelectedIndex:(NSInteger)index;
- (void) hideTabBar;
- (void) showTabBar;
- (void) setBadge:(NSInteger)value;
- (void) clearBadge;


@end
