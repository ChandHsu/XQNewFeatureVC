//
//  ViewController2.m
//  XQNewFeatureVC
//
//  Created by 徐强 on 15/10/14.
//  Copyright © 2015年 xuqiang. All rights reserved.
//

#import "ViewController2.h"
#import "UIColor+Random.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor randomColor];

}

- (void)thisVcDidEnterForeground{
    NSLog(@"第二个页面进入前台");
}

- (void)thisVcDidEnterBackground{
    NSLog(@"第二个页面进入后台");
}
- (void)thisVcGettingIntoForegroundWithRatio:(CGFloat)ratio{
    NSLog(@"第二个控制器%%%f进入了前台",ratio*100);
}

- (void)thisVcGettingIntoBackgroundWithRatio:(CGFloat)ratio{
    NSLog(@"第二个控制器%%%f进入了后台",ratio*100);
}


@end
