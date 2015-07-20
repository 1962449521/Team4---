//
//  TabBarView.m
//  DaFenBa
//
//  Created by 胡 帅 on 14-9-5.
//  Copyright (c) 2014年 胡 帅. All rights reserved.
//-------------------------------------
//revised by 胡 帅 on 2015/07/20
//

#import "T4_TabBarView.h"

@implementation T4_TabBarView
{
    UIImageView    *_bgImageView;     // image of taBarView, chaged when button switched
    NSArray        *_iconNames;       // save name of barItem image
    NSArray        *_viewController;  // save all top viewcontrollers corresponding to tabbar(we will put it in our navigationcontroller)
}

- (T4_TabBarView *)initWithTabBarHeight:(CGFloat)height andTabIconArr:(NSArray *)iconNames andBadgeIndex:(int)bageIndex{
    // initialize from super
    CGFloat screenWidth  = [[UIScreen mainScreen]bounds].size.width;
    CGFloat screenHeight = [[UIScreen mainScreen]bounds].size.height;
    CGFloat tabBarWidth  = screenWidth;
    CGFloat tabBarHeight = height;
    CGRect frame = CGRectMake(0,
                              screenHeight-tabBarHeight,
                              tabBarWidth,
                              tabBarHeight);
    self = [super initWithFrame:frame];
    if (self) {
        //  private variables initialization
        _iconNames      = iconNames;
        // add bg image
        _bgImageView = [[UIImageView alloc]initWithFrame:self.bounds];
        [self addSubview:_bgImageView];
        // add badge
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(tabBarWidth/[iconNames count]/1.3 + bageIndex*tabBarWidth/[iconNames count], 5, 20, 20)];
        [label setBackgroundColor:[UIColor redColor]];
        [label setTextColor:[UIColor whiteColor]];
        label.text = @" 5";
        [self addSubview:label];
        _badge = label;
        // add buttons
        for (int index=0; index < iconNames.count; index++) {
            CGRect btnRect = CGRectMake(index*screenWidth/[iconNames count], 0, screenWidth/[iconNames count], tabBarHeight);
            UIButton *btn = [[UIButton alloc]initWithFrame:btnRect];
            btn.tag       = index;
            //[tempArray addObject:btn];
            [self addSubview:btn];
            // add button action
            [btn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    return self;
}

/**
 *  set the bage to circlue
 */
- (void)layoutSubviews{
    [super layoutSubviews];
    self.badge.clipsToBounds = YES;
    self.badge.layer.cornerRadius = self.badge.frame.size.width/2.0;
}

/**
 *  button click action
 *
 *  @param  button
 */
- (void) buttonClicked:(UIButton *)sender{
    if ([self.delegate shouldSelectIndex:sender.tag]) {
        [self setSelectedIndex:sender.tag];
        [self.delegate didSelectedIndex:sender.tag];
    }
}
/**
 *  setter Method
 *
 *  @param index selected
 */
- (void)setSelectedIndex:(NSInteger )index{
    [_bgImageView setImage:[UIImage imageNamed:_iconNames[index]]];
}

@end
