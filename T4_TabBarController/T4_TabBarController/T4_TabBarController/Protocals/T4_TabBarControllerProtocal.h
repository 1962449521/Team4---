
/*!
 @header T4_TabBarControllerProtocal.h
 @abstract 程序主界面需实现的协议
 @author 胡 帅
 @version 1.00 2014/08/04 Creation
 
 -------------------------------------
 revised by 胡 帅 on 2015/07/20
 
 */


#import <Foundation/Foundation.h>

@class T4_TabBarView;
@class T4_TabBarController;

@protocol T4_TabBarControllerProtocal <NSObject>

/**
 *  tabBar
 */
@property (nonatomic, strong, readonly) T4_TabBarView *tabBar;

/**
 *  当前选择序号
 */
@property (nonatomic, assign, readonly) NSInteger selectedIndex;

/**
 *  当前选择VC
 */
@property (nonatomic, weak, readonly) UINavigationController *selectedViewController;

/**
 *  子控制器数组
 */
@property (nonatomic, strong) NSArray *viewControllers;

/**
 *  tabBar当前状态是否为隐藏
 */

@property (nonatomic, assign,readonly) BOOL isHidenTabBar;

#pragma mark - initialization
/**
 *  初始化方法
 *
 *  @param height          tabBar的高度
 *  @param iconNames       图标的名字列表
 *  @param viewControllers 子控制器列表
 *
 *  @return 仿制UITabBarController
 */
- (T4_TabBarController *)initWithTabBarHeight:(CGFloat)height andTabIconArr:(NSArray *)iconNames andVCArr:(NSArray *)viewControllers  andBadgeIndex:(int)bageIndex;

#pragma mark - button click

/**
 *  人为伪造按钮点击
 *
 *	@param 	index 	将选择VC的tabBar序号
 *
 *	@return	
 */
- (void)setSelectedIndex:(NSInteger)selectedIndex;

/**
 *  将要选择第index栏
 *
 *	@param 	index 	将选择VC的tabBar序号
 *
 *	@return	返回是否允许选择该栏
 */
- (BOOL)shouldSelectIndex:(NSInteger)index;

/**
 *  已选择时需执行的动作，如更换显示的view
 *
 *	@param 	index 	已选择VC的taBar序号
 */
- (void)didSelectedIndex:(NSInteger)index;

#pragma mark - show & hide bar
/**
 *  执行隐藏tabBar
 */
- (void)hideTabBar;

/**
 *  执行显示taBar
 */
- (void)showTabBar;

#pragma mark - bage
/**
 *  set Badge
 *  @param value 设置显示的badge的值 1-9为数字，>9为‘N'
 *
 */
-(void)setBadge:(NSInteger)value;
/**
 *  clear Badge
 *  @param value 清除badge值.
 *
 */

-(void)clearBadge;



@end
