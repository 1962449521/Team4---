/*!
 @header T4_TabBarViewProtocal.h
 @abstract 程序主界面的tabBar需要实现的协议
 @author 胡 帅
 @version 1.00 2014/08/04 Creation
 
 -------------------------------------
 revised by 胡 帅 on 2015/07/20
 
 
 */
#import <Foundation/Foundation.h>
#import "T4_TabBarControllerProtocal.h"

@protocol T4_TabBarViewProtocal <NSObject>

/**
 *		该tabbarview所属的mainVC
 */
@property (nonatomic, weak) id<T4_TabBarControllerProtocal> delegate;


/**
 *		消息栏的badge提示 本设计只提供一个badge
 */
@property (nonatomic, weak) IBOutlet UILabel *badge;


- (T4_TabBarView *)initWithTabBarHeight:(CGFloat)height andTabIconArr:(NSArray *)iconNames andBadgeIndex:(int)bageIndex;

/**
 *		更改图标选中外观，不执行任何操作
 *
 *	@param 	index 	selected
 */
- (void)setSelectedIndex:(NSInteger )index;


@end
