//
//  UICollectionViewWaterfallLayout.h
//  UICollectionViewWaterfallLayout
//
//  Created by sun on 2017/1/17.
//  Copyright © 2017年 sunli-ang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UICollectionViewWaterfallLayout;
@protocol UICollectionViewDelegateWaterfallLayout <UICollectionViewDelegate>
//每个cell高度指定代理
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewWaterfallLayout *)collectionViewLayout
 heightForItemAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface UICollectionViewWaterfallLayout : UICollectionViewLayout
@property (nonatomic, weak) id<UICollectionViewDelegateWaterfallLayout> delegate;
@property (nonatomic, assign) NSUInteger columnCount; // 列数
@property (nonatomic, assign) CGFloat itemWidth; // item的宽度
@property (nonatomic, assign) UIEdgeInsets sectionInset; // 每个section的边框间距
@property (nonatomic, assign) CGFloat minLineSpacing;  //每行每列的间隔

@end
