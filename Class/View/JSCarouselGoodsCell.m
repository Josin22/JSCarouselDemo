//
//  JSCarouselGoodsCell.m
//  JSCarouselDemo
//
//  Created by 乔同新 on 16/6/13.
//  Copyright © 2016年 乔同新. All rights reserved.
//

#import "JSCarouselGoodsCell.h"
#import "JSGoodsModel.h"

@interface JSCarouselGoodsCell ()
@property (weak, nonatomic) IBOutlet UIImageView *goodImageView;
@property (weak, nonatomic) IBOutlet UILabel *goodNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *goodPriceLabel;

@end

@implementation JSCarouselGoodsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(JSGoodsModel *)model{
    
    _model = model;
    
    _goodImageView.image = [UIImage imageNamed:model.p_imageURL];
    
    _goodNameLabel.text = model.p_name;
    
    _goodPriceLabel.text = [NSString stringWithFormat:@"￥%0.2f",model.p_price];
}

@end
