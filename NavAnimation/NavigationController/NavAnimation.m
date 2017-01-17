//
//  NavAnimation.m
//  NavAnimation
//
//  Created by sun on 2017/1/17.
//  Copyright © 2017年 sunli-ang. All rights reserved.
//

#import "NavAnimation.h"
@interface NavAnimation ()
@property (nonatomic, weak) id<UIViewControllerContextTransitioning> transitionContext;
@end

@implementation NavAnimation
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.3;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIView* contentView = [transitionContext containerView];
    contentView.backgroundColor = [UIColor whiteColor];
    
    
    UIViewController* toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    __block UIImageView* imageView = [[UIImageView alloc] initWithImage:self.imageView.image];
    imageView.frame = self.isPush ? self.origionRect : self.nextRext;
    imageView.backgroundColor = self.imageView.backgroundColor;
    [contentView addSubview:toVc.view];
    toVc.view.alpha = 0;
    
    [contentView addSubview:imageView];
    [UIView animateWithDuration:0.2 animations:^{
        toVc.view.alpha = 1.0f;
    }];
    
    UIImage* image = nil;
    if (!self.isPush) {
        image = [self.imageView.image copy];
        self.imageView.image = nil;
    }
    
    NSTimeInterval interval = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:interval animations:^{
        imageView.frame = self.isPush ? self.nextRext : self.origionRect;
    } completion:^(BOOL finished) {
        
        if ([self.delegate respondsToSelector:@selector(didFinishTransition)] && self.isPush) {
            [self.delegate didFinishTransition];
        }
        
        [transitionContext completeTransition:YES];
        
        [imageView removeFromSuperview];
        if (!self.isPush) {
            self.imageView.image = image;
        }
        imageView = nil;
    }];
    
    
    
}
@end
