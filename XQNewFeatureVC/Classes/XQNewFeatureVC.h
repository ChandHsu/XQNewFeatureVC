//
//  XQNewFeatureVC.h
//  XQNewFeatureVC
//
//  Created by 徐强 on 15/10/13.
//  Copyright © 2015年 xuqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XQNewFeatureVC : UIViewController


@property (nonatomic, assign) BOOL             pageControlHidden;// default is NO;
@property (nonatomic, strong) UIColor          *pageIndicatorTintColor;// default is grayColor

@property (nonatomic, weak  ) UIButton         *completeBtn;
@property (nonatomic, copy  ) dispatch_block_t completeBlock;
@property (nonatomic, copy  ) NSString         *completeBtnTitle;// default is @"进 入"
@property (nonatomic, strong) UIColor          *completeBtnColor;// default is redColor
@property (nonatomic, assign) CGFloat          completeBtnCornerRadius;// default is 0
@property (nonatomic, weak  ) UIImage          *completeBtnBackgroundImage;// default is nil
@property (nonatomic, weak  ) UIImage          *completeBtnImage;// default is nil

@property (nonatomic, strong) NSArray          *imagesNameArray;
/***  如果使用此属性并且要实现滚动期间的某种效果,所使用的controllers必须都继承XQNewFeatureBaseVc.h,并重写其中的两个方法  ***/
@property (nonatomic, strong) NSArray          *controllersArray;

- (instancetype)initWithFeatureImagesNameArray:(NSArray *)imagesNameArray;
/***  如果使用此方法并且要实现滚动时的某种效果,所使用的controllers必须都继承XQNewFeatureBaseVc.h,并重写其中的两个方法  ***/
- (instancetype)initWithFeatureControllerArray:(NSArray *)controllersArray;


@end
