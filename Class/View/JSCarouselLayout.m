//
//  JSCarouselLayout.m
//  JSCarouselDemo
//
//  Created by 乔同新 on 16/6/13.
//  Copyright © 2016年 乔同新. All rights reserved.
//

#import "JSCarouselLayout.h"

@interface JSCarouselLayout ()
{
    CGFloat _viewHeight;
    CGFloat _itemHeight;
}


@end

@implementation JSCarouselLayout

/**
 *  覆写prepareLayout,储存布局信息
 */
- (void)prepareLayout{
    
    [super prepareLayout];
    
    self.visibleCount = self.visibleCount<1?5:self.visibleCount;
    
    _viewHeight = CGRectGetWidth(self.collectionView.frame);
    _itemHeight = self.itemSize.width;
    //初始状态
    self.collectionView.contentInset = UIEdgeInsetsMake(0, (_viewHeight - _itemHeight) / 2, 0, (_viewHeight - _itemHeight) / 2);
    
}
/**
 *  储存视图内容
 *
 *  @param indexPath indexpath
 *
 *  @return frame、size、apha、hiden
 */
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    attributes.size = self.itemSize;
    
    CGFloat cY = (self.collectionView.contentOffset.x) + _viewHeight / 2;
    CGFloat attributesY = _itemHeight * indexPath.row + _itemHeight / 2;
    attributes.zIndex = -ABS(attributesY - cY);
    
    CGFloat delta = cY - attributesY;
    CGFloat ratio =  - delta / (_itemHeight * 2);
    CGFloat scale = 1 - ABS(delta) / (_itemHeight * 6.0) * cos(ratio * M_PI_4);
    
    attributes.alpha = scale;
    
    attributes.transform = CGAffineTransformMakeScale(scale, scale);
    
    CGFloat centerY = attributesY;
    
    attributes.center = CGPointMake(centerY, CGRectGetHeight(self.collectionView.frame) / 2);
    
    return attributes;
}
/**
 *  返回内容尺寸
 *
 *  @return 内容尺寸
 */
- (CGSize)collectionViewContentSize{
 
    NSInteger cellCount = [self.collectionView numberOfItemsInSection:0];
    return CGSizeMake(cellCount * _itemHeight, CGRectGetHeight(self.collectionView.frame));
}
/**
 *  指定的区域显示cell、SupplementaryView和DecorationView中哪些视图
 *
 *  @param rect rect
 *
 *  @return 返回一组UICollectionViewLayoutAttributes类型对象
 */
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSInteger cellCount = [self.collectionView numberOfItemsInSection:0];
    CGFloat centerY = ( self.collectionView.contentOffset.x) + _viewHeight / 2;
    NSInteger index = centerY / _itemHeight;
    NSInteger count = (self.visibleCount - 1) / 2;
    NSInteger minIndex = MAX(0, (index - count));
    NSInteger maxIndex = MIN((cellCount - 1), (index + count));
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger i = minIndex; i <= maxIndex; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
        [array addObject:attributes];
    }
    return array;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset
                                 withScrollingVelocity:(CGPoint)velocity {
    
    CGFloat index = roundf((( proposedContentOffset.x) + _viewHeight / 2 - _itemHeight / 2) / _itemHeight);
    
    proposedContentOffset.x = _itemHeight * index + _itemHeight / 2 - _viewHeight / 2;
    
    if (self.carouselSlideIndexBlock) {
        self.carouselSlideIndexBlock((NSInteger)index);
    }
    
    return proposedContentOffset;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return !CGRectEqualToRect(newBounds, self.collectionView.bounds);
}

@end
