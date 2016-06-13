//
//  JSCarouselLayout.h
//  JSCarouselDemo
//
//  Created by 乔同新 on 16/6/13.
//  Copyright © 2016年 乔同新. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^JSCarouselSlideIndexBlock)(NSInteger index);

@interface JSCarouselLayout : UICollectionViewLayout

@property (nonatomic, copy) JSCarouselSlideIndexBlock carouselSlideIndexBlock;

@property (nonatomic) NSInteger visibleCount;

@property (nonatomic) CGSize itemSize;

@end
