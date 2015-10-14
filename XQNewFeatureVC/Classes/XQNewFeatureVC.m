//
//  XQNewFeatureVC.m
//  XQNewFeatureVC
//
//  Created by 徐强 on 15/10/13.
//  Copyright © 2015年 xuqiang. All rights reserved.
//

#import "XQNewFeatureVC.h"
#import "XQNewFeatureBaseVc.h"


#define screenW  self.view.bounds.size.width
#define screenH  self.view.bounds.size.height

@interface XQNewFeatureVC () <UIScrollViewDelegate>

@property (nonatomic, weak) UIPageControl *pageControl;
@property (nonatomic, assign) NSInteger fromePage;

@end

@implementation XQNewFeatureVC

- (instancetype)initWithFeatureImagesNameArray:(NSArray *)imagesNameArray{
    
    if (self = [super init]) {
        self.imagesNameArray = imagesNameArray;
    }
    
    return self;
}

- (instancetype)initWithFeatureControllerArray:(NSArray *)controllersArray{
    
    if (self = [super init]) {
        self.controllersArray = controllersArray;
    }
    
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIScrollView *scrollView                  = [[UIScrollView alloc] init];
    scrollView.backgroundColor                = [UIColor whiteColor];
    scrollView.frame                          = self.view.bounds;
    scrollView.delegate                       = self;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled                  = YES;
    scrollView.bounces                        = NO;
    
    [self.view addSubview:scrollView];
    
    if (self.imagesNameArray.count == 0 && self.controllersArray.count == 0) {
        UILabel *label      = [[UILabel alloc] init];
        label.frame         = CGRectMake(0, self.view.frame.size.height/2 - 30, self.view.frame.size.width, 60);
        label.text          = @"没有添加展示资源";
        [scrollView addSubview:label];
        label.textAlignment = NSTextAlignmentCenter;
        return;
    }
    
    UIPageControl *pageControl         = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 30, self.view.bounds.size.width, 30)];
    pageControl.pageIndicatorTintColor = self.pageIndicatorTintColor ? self.pageIndicatorTintColor : [UIColor grayColor];
    pageControl.numberOfPages          = self.imagesNameArray.count  ? self.imagesNameArray.count  : self.controllersArray.count;
    pageControl.hidesForSinglePage     = YES;
    pageControl.hidden                 = self.pageControlHidden;

    [self.view addSubview:pageControl];
    self.pageControl                   = pageControl;

    NSUInteger count                   = self.imagesNameArray.count ? self.imagesNameArray.count : self.controllersArray.count;
    scrollView.contentSize             = CGSizeMake(screenW * count, screenH);

    if (self.imagesNameArray.count) {
        
        for (int i = 0; i<self.imagesNameArray.count; i++) {
            
            NSString *imageName    = self.imagesNameArray[i];
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
            imageView.frame        = CGRectMake(screenW * i, 0, screenW, screenH);
            [scrollView addSubview:imageView];
            
            if (i == self.imagesNameArray.count - 1) {
                if (!self.completeBtn) {
                    UIButton *completeBtn           = [UIButton buttonWithType:UIButtonTypeCustom];
                    completeBtn.backgroundColor     = self.completeBtnColor?self.completeBtnColor:[UIColor redColor];
                    completeBtn.layer.cornerRadius  = self.completeBtnCornerRadius?self.completeBtnCornerRadius:0;
                    completeBtn.layer.masksToBounds = YES;
                    [completeBtn addTarget:self action:@selector(completeBtnClick) forControlEvents:UIControlEventTouchUpInside];
                    [completeBtn setTitle:self.completeBtnTitle?self.completeBtnTitle:@"进  入" forState:UIControlStateNormal];
                    [completeBtn setBackgroundImage:self.completeBtnBackgroundImage?self.completeBtnBackgroundImage:nil forState:UIControlStateNormal];
                    [completeBtn setImage:self.completeBtnImage?self.completeBtnImage:nil forState:UIControlStateNormal];
                    
                    self.completeBtn = completeBtn;
                    [imageView addSubview:self.completeBtn];
                }else{
                    [imageView addSubview:self.completeBtn];// 这里重复添加是因为如果不这么做,在iOS9的情况下,很奇怪,并没有添加到imageView上,打断点才会出现
                }
                
                
                imageView.userInteractionEnabled = YES;
                
                CGSize size = self.completeBtn.bounds.size;
                
                if (CGSizeEqualToSize(size, CGSizeZero)) {
                    size = CGSizeMake(self.view.frame.size.width * 0.6, 40);
                }
                 self.completeBtn.frame = CGRectMake(self.view.frame.size.width / 2 - size.width / 2, self.pageControl.frame.origin.y - size.height, size.width, size.height);
                
            }
            
        }
        
    }else if(self.controllersArray.count){
        
        for (int i = 0; i<self.controllersArray.count; i++) {
            
            UIViewController *vc = self.controllersArray[i];
            vc.view.frame        = CGRectMake(screenW * i, 0, screenW, screenH);
            [scrollView addSubview:vc.view];
        }
    }
    
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    self.fromePage = self.pageControl.currentPage;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    self.pageControl.currentPage = (scrollView.contentOffset.x + screenW/2) / screenW;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
        if (self.imagesNameArray.count) {
    
        }else if (self.controllersArray.count){
            XQNewFeatureBaseVc *currentVc = self.controllersArray[self.pageControl.currentPage];
            [currentVc thisVcDidEnterForeground];
            
            XQNewFeatureBaseVc *fromeVc = self.controllersArray[self.fromePage];
            [fromeVc thisVcDidEnterBackground];
            
        }
}

- (void)completeBtnClick{
    
    if (self.completeBlock) {
        self.completeBlock();
    }
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}



@end
