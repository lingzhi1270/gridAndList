//
//  GridListModel.m
//  List_Grid
//
//  Created by lingzhi on 2016/10/24.
//  Copyright © 2016年 lingzhi. All rights reserved.
//

#import "GridListModel.h"

@implementation GridListModel

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    if (self) {
        
        self.imageurl = dict[@"imageurl"];
        
        self.wname = dict[@"wname"];
        self.jdPrice = [dict[@"jdPrice"] floatValue];
        self.totalCount = [dict[@"totalCount"] intValue];
    }
    
    return self;
}

+ (instancetype)modelWithDictionary:(NSDictionary *)dict
{
    return [[[self class] alloc] initWithDictionary:dict];
}
@end
