/*!
 @header TabBarView.h
 @abstract 主界面 tabBar实体类 遵循TabBarViewDelegate协议
 @author 胡帅
 @version 1.0 2014/08 Creation
 
 -------------------------------------
 revised by 胡 帅 on 2015/07/20
 

 */


#import <UIKit/UIKit.h>
#import "T4_TabBarViewProtocal.h"
@interface T4_TabBarView : UIView<T4_TabBarViewProtocal>
// properties and methods comments reference T4_TabBarViewProtocal.h

@property (nonatomic, weak)  UILabel *badge;

@property (nonatomic, weak) id<T4_TabBarControllerProtocal> delegate;

- (T4_TabBarView *)initWithTabBarHeight:(CGFloat)height andTabIconArr:(NSArray *)iconNames andBadgeIndex:(int)bageIndex;


@end
