//
//  ViewController.m
//  NavAnimation
//
//  Created by sun on 2017/1/17.
//  Copyright © 2017年 sunli-ang. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import "SUNNavigationController.h"
#import "DetailViewController.h"
#import "Macros.h"
#import "AFNetworking.h"
#import "UICollectionViewWaterfallLayout.h"
#import "OJLCollectionViewCell.h"
@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateWaterfallLayout>
@property (nonatomic, strong) NSArray* modelArray;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic) NSInteger page;
@property (nonatomic) CGFloat contentOffsetY,oldContentOffsetY, newContentOffsetY;
@property (nonatomic, strong) UICollectionView* collectionView;

@end

@implementation ViewController

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        self.dataSource = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataSource;
}
- (NSArray *)modelArray
{
    if (!_modelArray) {
        _modelArray = [Model models];
    }
    return _modelArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.page = 1;
    [self setupMain];
}


- (void)setupMain {
    
    UICollectionViewWaterfallLayout *water = [[UICollectionViewWaterfallLayout alloc] init];
    
    water.itemWidth = AdaptedW(180);
    water.sectionInset = UIEdgeInsetsMake(AdaptedW(5), AdaptedW(5), AdaptedW(5), AdaptedW(5));
    water.delegate = self;
    water.minLineSpacing = AdaptedW(5);
    water.columnCount = 2;
    
    
    UICollectionView* collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, MainWidth, MainHeight) collectionViewLayout:water];
    
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.backgroundColor = [UIColor whiteColor];
    [collectionView registerNib:[UINib nibWithNibName:@"OJLCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    self.collectionView = collectionView;
    [self.view addSubview:collectionView];
}
#pragma mark UICollectionViewDataSource, UICollectionViewDelegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.modelArray.count;
}
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    OJLCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.model = self.modelArray[indexPath.item];
    
    
    return cell;
}



#pragma mark OJLWaterLayoutDelegate
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewWaterfallLayout *)collectionViewLayout
 heightForItemAtIndexPath:(NSIndexPath *)indexPath {
        
        Model* model = self.modelArray[indexPath.item];

        CGFloat width = AdaptedW(170);
        
        CGFloat scale = [model.w floatValue] / width;
        
        CGFloat height =  [model.h floatValue] / scale + 105;
        
        return height;
   
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    Model* model = self.modelArray[indexPath.item];
    
    OJLCollectionViewCell* cell = (OJLCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
    
    CGRect desImageViewRect = CGRectMake(0, 60 + 64, [model scaleSize].width, [model scaleSize].height);
    DetailViewController* vc = [[DetailViewController alloc] initWithModel:model desImageViewRect:desImageViewRect];
    SUNNavigationController *NAV = (SUNNavigationController *)self.navigationController;
    [NAV pushViewController:vc withImageView:cell.imageView nextRext:desImageViewRect delegate:vc];
    
}



@end
