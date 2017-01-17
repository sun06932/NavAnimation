//
//  SUNNavigationController.m
//  NavAnimation
//
//  Created by sun on 2017/1/17.
//  Copyright © 2017年 sunli-ang. All rights reserved.
//

#import "SUNNavigationController.h"
#import "Macros.h"

@interface SUNNavigationController ()<UINavigationControllerDelegate, UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIImageView* imageView;
@property (nonatomic, assign) CGRect origionRect;
@property (nonatomic, assign) CGRect nextRext;
@property (nonatomic, assign) BOOL isPush;
@property (nonatomic, weak) id  animationDelegate;

@end

@implementation SUNNavigationController

#pragma mark - 自定义back按钮
- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置interactivePopGestureRecognizer委托，自定义Back按钮，左侧滑返回
    self.interactivePopGestureRecognizer.delegate = self;
    // 设置导航栏字体风格
    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17], NSForegroundColorAttributeName:HexRGB(0x4d4d4d)}];
    
}

#pragma mark - 自定义back按钮

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 自定义back按钮
    if (self.viewControllers.count != 0) {
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:iconBack] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)]  style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
        // 隐藏tabBar当push
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

// back按钮返回的事件
- (void)backAction {
    [self popViewControllerAnimated:true];
}
-(void)pushViewController:(UIViewController *)viewController
            withImageView:(UIImageView *)imageView
                 nextRext:(CGRect)nextRext
                 delegate:(id<NavAnimationDelegate>)delegate {
    
    self.delegate = self;
    self.imageView = imageView;
    
    CGRect frame = CGRectMake(0, 0, imageView.frame.size.width, imageView.frame.size.height);
    self.origionRect = [imageView convertRect:frame toView:self.view];
    
    self.nextRext = nextRext;
    self.isPush = YES;
    self.animationDelegate = delegate;
    
    [super pushViewController:viewController animated:YES];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated{
    
    self.isPush = NO;
    
    return  [super popViewControllerAnimated:animated];
}
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    
    NavAnimation* animation = [[NavAnimation alloc] init];
    
    animation.imageView = self.imageView;
    
    animation.origionRect = self.origionRect;
    
    animation.nextRext = self.nextRext;
    
    animation.isPush = self.isPush;
    
    animation.delegate = self.animationDelegate;
    
    if (!self.isPush && self.delegate) {
        self.delegate = nil;
    }
    return animation;
}




@end
