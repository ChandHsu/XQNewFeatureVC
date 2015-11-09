//
//  XQNewFeatureBaseVc.h
//  XQNewFeatureVC
//
//  Created by 徐强 on 15/10/14.
//  Copyright © 2015年 xuqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XQNewFeatureBaseVc : UIViewController

/***  控制器进入展示区  ***/
- (void)thisVcDidEnterForeground;
/***  控制器离开展示区  ***/
- (void)thisVcDidEnterBackground;

@end
