//
//  JSCarouselUIService.h
//  JSCarouselDemo
//
//  Created by 乔同新 on 16/6/13.
//  Copyright © 2016年 乔同新. All rights reserved.
//
#import <UIKit/UIKit.h>

@class JSCarouselViewModel;

@interface JSCarouselUIService : NSObject<UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) JSCarouselViewModel *viewModel;

@end
