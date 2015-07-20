//
//  AppDelegate.m
//  T4_TabBarController
//
//  Created by 胡 帅 on 15/7/20.
//  Copyright (c) 2015年 none. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    _window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    
    // create tabBarController
    UIViewController *vc0 = [UIViewController new];
    UIViewController *vc1 = [UIViewController new];
    UIViewController *vc2 = [UIViewController new];
    UIViewController *vc3 = [UIViewController new];
    UIViewController *vc4 = [UIViewController new];
    
    vc0.view.backgroundColor = [UIColor greenColor];
    vc1.view.backgroundColor = [UIColor redColor];
    vc2.view.backgroundColor = [UIColor yellowColor];
    vc3.view.backgroundColor = [UIColor purpleColor];
    vc4.view.backgroundColor = [UIColor blueColor];
    

    _tabBarController  = [[T4_TabBarController alloc]initWithTabBarHeight:50 andTabIconArr:@[@"tabbar_0",@"tabbar_1",@"tabbar_2",@"tabbar_3",@"tabbar_4",] andVCArr:@[vc0, vc1, vc2, vc3, vc4] andBadgeIndex:0];
    _window.rootViewController = _tabBarController;
    
    
    // test show/hide of tabbar
    UIButton *btn0 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn0 addTarget:self action:@selector(testTabBarShowAndHide:) forControlEvents:UIControlEventTouchUpInside];
    [btn0 setFrame:CGRectMake(50, 50, 200, 50)];
    [btn0 setTitle:@"show/hide" forState:UIControlStateNormal];
    [vc0.view addSubview:btn0];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 addTarget:self action:@selector(testTabBarShowAndHide:) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setFrame:CGRectMake(50, 50, 200, 50)];
    [btn1 setTitle:@"show/hide" forState:UIControlStateNormal];
    [vc1.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 addTarget:self action:@selector(testTabBarShowAndHide:) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setFrame:CGRectMake(50, 50, 200, 50)];
    [btn2 setTitle:@"show/hide" forState:UIControlStateNormal];
    [vc2.view addSubview:btn2];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn3 addTarget:self action:@selector(testTabBarShowAndHide:) forControlEvents:UIControlEventTouchUpInside];
    [btn3 setFrame:CGRectMake(50, 50, 200, 50)];
    [btn3 setTitle:@"show/hide" forState:UIControlStateNormal];
    [vc3.view addSubview:btn3];
    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn4 addTarget:self action:@selector(testTabBarShowAndHide:) forControlEvents:UIControlEventTouchUpInside];
    [btn4 setFrame:CGRectMake(50, 50, 200, 50)];
    [btn4 setTitle:@"show/hide" forState:UIControlStateNormal];
    [vc4.view addSubview:btn4];
    // test end
    
    // test setBadge
    UITextField *bageNumberTextField = [[UITextField alloc]initWithFrame:CGRectMake(100, 120, 150, 30)];
    bageNumberTextField.text         = @"1";
    bageNumberTextField.tag          = 110;
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"bageNum:";
    [label setFrame:CGRectMake(0, 120, 100, 30)];
    
    UIButton *setBageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [setBageButton setFrame:CGRectMake(80, 150, 200, 50)];
    [setBageButton setTitle:@"set badge" forState:UIControlStateNormal];
    
    UIButton *clearButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [clearButton setFrame:CGRectMake(80, 200, 200, 50)];
    [clearButton setTitle:@"clear badge" forState:UIControlStateNormal];

    [vc0.view addSubview:label];
    [vc0.view addSubview:bageNumberTextField];
    [vc0.view addSubview:setBageButton];
    [vc0.view addSubview:clearButton];

    [setBageButton addTarget:self action:@selector(setBage:) forControlEvents:UIControlEventTouchUpInside];
    [clearButton addTarget:self action:@selector(clearBage:) forControlEvents:UIControlEventTouchUpInside];

    
    // test end
    [_window makeKeyAndVisible];
    
    return YES;
}

-(void)testTabBarShowAndHide:(UIButton *)testButton
{
    if (_tabBarController.isHidenTabBar) {
        [_tabBarController showTabBar];
    }
    else {
        [_tabBarController hideTabBar];
    }
}
-(void)setBage:(UIButton *)sender
{
    UITextField *tf = (UITextField *)[_tabBarController.view viewWithTag:110];
    [tf resignFirstResponder];
    NSInteger newNum = [tf.text integerValue];
    [_tabBarController setBadge:newNum];
    
}
-(void)clearBage:(UIButton *)sender
{
    UITextField *tf = (UITextField *)[_tabBarController.view viewWithTag:110];
    [tf resignFirstResponder];

    [_tabBarController clearBadge];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
