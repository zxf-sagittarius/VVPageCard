//
//  VVHomeLayout.m
//  VVPageCard_Example
//
//  Created by zxfei on 2020/7/15.
//  Copyright © 2020 zxfei. All rights reserved.
//

#import "VVHomeLayout.h"
#import "VVHomeModel.h"
#import "VVCardsLayouts.h"
#import "VVBannerLayout.h"
#import "VVBasicLayout.h"

@implementation VVHomeLayout

+ (instancetype)map:(VVHomeModel *)homeModel {
    
    VVHomeLayout *layout = [[VVHomeLayout alloc] init];
    
    layout.cardsLayout = [VVCardsLayouts map:homeModel.cardsGroup injectLayoutMap:^NSDictionary<NSString *,Class> * _Nullable{
        return @{
            [VVBasicInfo modelType] : [VVBasicLayout class],
            [VVBannerInfo modelType] : [VVBannerLayout class]
        };
    }];
    
    return layout;
}

@end
