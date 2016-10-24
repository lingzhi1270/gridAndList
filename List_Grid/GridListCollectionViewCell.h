//
//  GridListCollectionViewCell.h
//  List_Grid
//
//  Created by lingzhi on 2016/10/24.
//  Copyright © 2016年 lingzhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GridListModel;
@interface GridListCollectionViewCell : UICollectionViewCell

@property (nonatomic,assign)BOOL isGrid;

@property (nonatomic,strong)GridListModel *model;

@end
