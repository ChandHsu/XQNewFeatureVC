# XQNewFeatureVC
使用方法:<br>
在`AppDelegate`导入头文件`#import "XQNewFeatureVC.h"`
<br>
```objc
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window = window;
    
    [self.window makeKeyAndVisible];
    
    // 沙盒版本
    NSString *version =[NSKeyedUnarchiver unarchiveObjectWithFile:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"version.data"]];
    
    // app当前版本
    NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
    NSString *currentVersion = [infoDict objectForKey:@"CFBundleShortVersionString"];
    
    if ([currentVersion isEqualToString:version]) {
        
        self.window.rootViewController = [[ViewController alloc] init];
    }else{
        /*** 1.展示图片  ***/
        XQNewFeatureVC *newVc = [[XQNewFeatureVC alloc] initWithFeatureImagesNameArray:@[@"1",@"2",@"3",@"4"]];
        /*** 2.展示控制器  ***/
//        ViewController1 *vc1 = [ViewController1 new];
//        ViewController2 *vc2 = [ViewController2 new];
//        ViewController3 *vc3 = [ViewController3 new];
//        XQNewFeatureVC *newVc = [[XQNewFeatureVC alloc] initWithFeatureControllerArray:@[vc1,vc2,vc3]];
        newVc.pageIndicatorTintColor = [UIColor randomColor];
        self.window.rootViewController = newVc;
        newVc.completeBlock = ^{// 跳到app正常页面 
            self.window.rootViewController = [[ViewController alloc] init];
        };
        
        // 保存当前版本
//        [NSKeyedArchiver archiveRootObject:currentVersion toFile:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"version.data"]];
    }
    
    return YES;
}
```
各种属性实现自定义:<br>
```objc
/*** pageControl的隐藏属性  **/
@property (nonatomic, assign) BOOL             pageControlHidden;// default is NO;
/*** pageControl的颜色属性  **/
@property (nonatomic, strong) UIColor          *pageIndicatorTintColor;// default is grayColor
/*** 完成按钮,对其设置属性  **/
@property (nonatomic, weak  ) UIButton         *completeBtn;
/*** 完成按钮的点击block  **/
@property (nonatomic, copy  ) dispatch_block_t completeBlock;

@property (nonatomic, copy  ) NSString         *completeBtnTitle;// default is @"进 入"
@property (nonatomic, strong) UIColor          *completeBtnColor;// default is redColor
@property (nonatomic, assign) CGFloat          completeBtnCornerRadius;// default is 0
@property (nonatomic, weak  ) UIImage          *completeBtnBackgroundImage;// default is nil
@property (nonatomic, weak  ) UIImage          *completeBtnImage;// default is nil
```
在使用控制器视图的时候,要实现一系列的动画效果:<br>
1.要展示的控制器继承XQNewFeatureBaseVc;<br>
2.重写下面两个方法
```objc
/***  控制器进入展示区  ***/
- (void)thisVcDidEnterForeground;

/***  控制器离开展示区  ***/
- (void)thisVcDidEnterBackground;

/***  控制器正在进入(移出)展示区  ratio:在前台显示的比例  ***/
- (void)thisVcGettingIntoForegroundWithRatio:(CGFloat)ratio;
```
如果有其他需要,请酌情自定义,内部代码非常的简单;
目前只完成了这两个用的最多的功能,后续会添加更多,其中有很多不足的地方,如果有什么建议或意见,还请一起交流探讨,大家共同进步,我的联系方式  QQ:296646879<br>
您的每一次 Star 都是给我的鼓励,如果对你有帮助,请 Star 或 Fork 一下.☺☺☺☺☺
