//
//  NavAnimation.m
//  NavAnimation
//
//  Created by sun on 2017/1/17.
//  Copyright © 2017年 sunli-ang. All rights reserved.
//

#import "OJLCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "Macros.h"

@interface OJLCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UILabel *num;

@property (weak, nonatomic) IBOutlet UILabel *num1;
@property (weak, nonatomic) IBOutlet UIImageView *img1;

@property (weak, nonatomic) IBOutlet UIImageView *img2;

@property (weak, nonatomic) IBOutlet UILabel *nameLB;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;


@end
@implementation OJLCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.label layoutIfNeeded];
    self.contentView.layer.cornerRadius = 4;
    
    
    self.iconImageView.layer.cornerRadius = 11;
    self.iconImageView.layer.masksToBounds = YES;
    self.imageView.layer.cornerRadius = 5;
    self.imageView.layer.masksToBounds = YES;
    self.nameLB.textColor = HexRGB(0x4d4d4d);
    self.nameLB.font = [UIFont systemFontOfSize:AdaptedW(15)];
    
    self.label.textColor = HexRGB(0x4d4d4d);
    self.label.font = [UIFont systemFontOfSize:AdaptedW(15)];
    
    self.num.textColor = HexRGB(0xa9a9a9);
    self.num.font = [UIFont systemFontOfSize:8];
    self.num1.textColor = HexRGB(0xa9a9a9);
    self.num1.font = [UIFont systemFontOfSize:8];

}


-(void)setModel:(Model *)model{
    _model = model;
    self.nameLB.text = model.name;
    
    self.label.text = model.des;
    self.num.text = @"3333";
    self.num1.text = @"3333";
    [self.imageView  sd_setImageWithURL:[NSURL URLWithString:model.img] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        model.w = [NSString stringWithFormat:@"%.2f",image.size.width];
        model.h = [NSString stringWithFormat:@"%.2f",image.size.height];
        
    }];
}

//- (void)setHighlighted:(BOOL)highlighted {
//    [super setHighlighted:highlighted];
//    if (highlighted) {
//        self.backgroundColor = HexRGB(0xececec);
//    } else {
//        self.backgroundColor = [UIColor whiteColor];
//    }
//}

@end
