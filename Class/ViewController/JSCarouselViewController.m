//
//  JSCarouselViewController.m
//  JSCarouselDemo
//
//  Created by 乔同新 on 16/6/13.
//  Copyright © 2016年 乔同新. All rights reserved.
//

#import "JSCarouselViewController.h"
#import "JSCarouselLayout.h"
#import "JSCarouselViewModel.h"
#import "JSCarouselUIService.h"

@interface JSCarouselViewController ()

@property (nonatomic, strong) UICollectionView    *carouselCollectionView;

@property (nonatomic, strong) JSCarouselViewModel *viewModel;

@property (nonatomic, strong) JSCarouselUIService *service;

@property (nonatomic, retain) UILabel *indexLabel;

@property (nonatomic, assign) NSInteger allCount;

@end

@implementation JSCarouselViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"JSCarousel";
    self.view.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8];
    self.automaticallyAdjustsScrollViewInsets = NO;
    /*  */
    [self.view addSubview:self.carouselCollectionView];
    /*  */
    [self.viewModel getData];
    [self.carouselCollectionView reloadData];
    /*  */
    _indexLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.carouselCollectionView.frame), self.view.frame.size.width, 20)];
    _indexLabel.textAlignment = NSTextAlignmentCenter;
    _indexLabel.font = [UIFont systemFontOfSize:13];
    _allCount = [self.viewModel.data count];
    _indexLabel.text = [NSString stringWithFormat:@"浏览记录(1/%li)",_allCount];
    [self.view addSubview:_indexLabel];
    
}

#pragma mark - lazy load

- (JSCarouselViewModel *)viewModel{
    
    if (!_viewModel) {
        _viewModel = [[JSCarouselViewModel alloc] init];
    }
    return _viewModel;
}

- (JSCarouselUIService *)service{
    
    if (!_service) {
        _service = [[JSCarouselUIService alloc] init];
        _service.viewModel = self.viewModel;
    }
    return _service;
}

- (UICollectionView *)carouselCollectionView{
    
    if (!_carouselCollectionView) {
        
        JSCarouselLayout *layout                = [[JSCarouselLayout alloc] init];
        __weak typeof (self)weakSelf            = self;
        layout.carouselSlideIndexBlock          = ^(NSInteger index){
            weakSelf.indexLabel.text = [NSString stringWithFormat:@"浏览足迹(%li/%li)",index+1,_allCount];
        };
        layout.itemSize                         = CGSizeMake(190, 262);
        _carouselCollectionView                 = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 270)
                                                     collectionViewLayout:layout];
        _carouselCollectionView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        _carouselCollectionView.dataSource      = self.service;
        _carouselCollectionView.delegate        = self.service;
        _carouselCollectionView.showsHorizontalScrollIndicator = NO;
        _carouselCollectionView.showsVerticalScrollIndicator = NO;
        [_carouselCollectionView registerNib:[UINib nibWithNibName:@"JSCarouselGoodsCell" bundle:nil]
                  forCellWithReuseIdentifier:@"JSCarouselGoodsCell"];
    }
    return _carouselCollectionView;
}

@end
