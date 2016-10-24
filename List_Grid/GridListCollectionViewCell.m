//
//  GridListCollectionViewCell.m
//  List_Grid
//
//  Created by lingzhi on 2016/10/24.
//  Copyright © 2016年 lingzhi. All rights reserved.
//

#import "GridListCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "GridListModel.h"

#define ScreenWidth ([UIScreen mainScreen].bounds.size.width)

@interface GridListCollectionViewCell()

@property (nonatomic,strong)UIImageView *imgV;
@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,strong)UILabel *priceLabel;


@end

@implementation GridListCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self configureUI];
    }
    return self;
}

- (void)configureUI
{
    UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:imgV];
    self.imgV = imgV;
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    titleLabel.numberOfLines = 0;
    titleLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    
    UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    priceLabel.textColor = [UIColor redColor];
    priceLabel.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:priceLabel];
    self.priceLabel = priceLabel;

}

-(void)setIsGrid:(BOOL)isGrid
{
    
    _isGrid = isGrid;
    if (isGrid)
    {
        self.imgV.frame = CGRectMake(5, 5, self.bounds.size.width-60, self.bounds.size.width-60);
        self.titleLabel.frame = CGRectMake(5, self.bounds.size.width - 45, ScreenWidth/2-60, 20);
        self.priceLabel.frame = CGRectMake(5, self.bounds.size.width - 20, ScreenWidth/2, 20);
        
    }
    else
    {
        self.imgV.frame = CGRectMake(5, 5, self.bounds.size.height - 10, self.bounds.size.height - 10);
        self.titleLabel.frame = CGRectMake(self.bounds.size.height + 10, 0, ScreenWidth/2, self.bounds.size.height - 20);;
        self.priceLabel.frame = CGRectMake(self.bounds.size.height + 10, self.bounds.size.height - 30, ScreenWidth/2, 20);
    }
    
}

- (void)setModel:(GridListModel *)model
{
    _model = model;
//    [self.imgV sd_setImageWithURL:[NSURL URLWithString:model.imageurl] placeholderImage:nil];
    [self.imgV sd_setImageWithURL:[NSURL URLWithString:model.imageurl] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (!image) {
            [self.imgV setImage:[UIImage imageNamed:@"jww"]];
        }
    }];
    
    [self.titleLabel setText:model.wname];
    [self.priceLabel setText:[NSString stringWithFormat:@"￥%.2f",model.jdPrice]];
    
}

@end
