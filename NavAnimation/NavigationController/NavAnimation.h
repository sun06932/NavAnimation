//
//  NavAnimation.h
//  NavAnimation
//
//  Created by sun on 2017/1/17.
//  Copyright © 2017年 sunli-ang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol NavAnimationDelegate <NSObject>

-(void)didFinishTransition;

@end

@interface NavAnimation : NSObject<UIViewControllerAnimatedTransitioning>
@property (nonatomic, strong) UIImageView* imageView;
@property (nonatomic, assign) CGRect origionRect;
@property (nonatomic, assign) CGRect nextRext;
@property (nonatomic, assign) BOOL isPush;
@property (nonatomic, weak) id <NavAnimationDelegate> delegate;

@end
