//
//  GridListModel.h
//  List_Grid
//
//  Created by lingzhi on 2016/10/24.
//  Copyright © 2016年 lingzhi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GridListModel : NSObject

@property (nonatomic,strong)NSString *imageurl;
@property (nonatomic,strong)NSString *wname;
@property (nonatomic,assign)float jdPrice;
@property (nonatomic,assign)int totalCount;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

+ (instancetype)modelWithDictionary:(NSDictionary *)dict;

@end
