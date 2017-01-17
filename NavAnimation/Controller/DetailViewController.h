//
//  DetailViewController.h
//  redBook
//
//  Created by oujinlong on 16/6/3.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavAnimation.h"
#import "Model.h"
@interface DetailViewController : UIViewController <NavAnimationDelegate>
-(instancetype)initWithModel:(Model*)model desImageViewRect:(CGRect)desRect;;
@end
