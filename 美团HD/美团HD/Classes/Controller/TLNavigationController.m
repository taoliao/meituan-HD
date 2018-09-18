//
//  TLNavigationController.m
//  美团HD
//
//  Created by corepress on 2018/8/15.
//  Copyright © 2018年 corepress. All rights reserved.
//

#import "TLNavigationController.h"

@interface TLNavigationController ()

@end

@implementation TLNavigationController

+(void)initialize {

    UINavigationBar *naviBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[TLNavigationController class]]];
    
    [naviBar setBackgroundImage:[UIImage imageNamed:@"bg_navigationBar_normal"] forBarMetrics:UIBarMetricsDefault];
    
}

@end
