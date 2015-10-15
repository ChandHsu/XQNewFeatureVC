//
//  UIColor+Random.m
//  福钱包
//
//  Created by 徐强 on 15/8/31.
//  Copyright (c) 2015年 众福财富. All rights reserved.
//

#import "UIColor+Random.h"

@implementation UIColor (Random)

+ (UIColor *)randomColor
{
    UIColor *color = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1.0];
    
    return color;
    
}

@end
