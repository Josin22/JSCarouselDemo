//
//  JSCarouselViewModel.m
//  JSCarouselDemo
//
//  Created by 乔同新 on 16/6/13.
//  Copyright © 2016年 乔同新. All rights reserved.
//

#import "JSCarouselViewModel.h"
#import "JSGoodsModel.h"

@implementation JSCarouselViewModel

- (void)getData{
    
    NSInteger count = 20;
    
    NSMutableArray *data = [[NSMutableArray alloc] initWithCapacity:count];
    int frakeIndex = 0;
    for (int i = 0; i<count; i++) {
        JSGoodsModel *model = [[JSGoodsModel alloc] init];
        model.p_price = 10.0+i;
        model.p_name = [NSString stringWithFormat:@"%@这是一款商品这是一款商品这是一款商品",@(i)];
        model.p_imageURL = [NSString stringWithFormat:@"pic_%d.jpg",frakeIndex];
        
        frakeIndex++;
        frakeIndex = frakeIndex>3?0:frakeIndex;
        
        [data addObject:model];
    }
    self.data = data;
}

@end
