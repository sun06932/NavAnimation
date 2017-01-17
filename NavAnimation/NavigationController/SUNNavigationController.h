//
//  SUNNavigationController.h
//  NavAnimation
//
//  Created by sun on 2017/1/17.
//  Copyright © 2017年 sunli-ang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavAnimation.h"
@interface SUNNavigationController : UINavigationController

-(void)pushViewController:(UIViewController *)viewController
            withImageView:(UIImageView *)imageView
                  nextRext:(CGRect)nextRext
                 delegate:(id<NavAnimationDelegate>)delegate;

@end
