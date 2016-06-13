//
//  JSCarouselUIService.m
//  JSCarouselDemo
//
//  Created by 乔同新 on 16/6/13.
//  Copyright © 2016年 乔同新. All rights reserved.
//

#import "JSCarouselUIService.h"
#import "JSCarouselGoodsCell.h"
#import "JSCarouselViewModel.h"
#import "JSGoodsModel.h"

@implementation JSCarouselUIService

#pragma mark - UICollectionView Delegate / DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return self.viewModel.data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    JSCarouselGoodsCell *cell= [collectionView dequeueReusableCellWithReuseIdentifier:@"JSCarouselGoodsCell"
                                                                         forIndexPath:indexPath];
    
    NSInteger row       = indexPath.row;
    JSGoodsModel *model = self.viewModel.data[row];
    cell.model          = model;
    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
   

}

@end
