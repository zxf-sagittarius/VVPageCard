//
//  VVHomeLayout.h
//  VVPageCard_Example
//
//  Created by zxfei on 2020/7/15.
//  Copyright © 2020 zxfei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VVBannerLayout.h"
#import "VVBasicLayout.h"

NS_ASSUME_NONNULL_BEGIN
@class VVHomeModel,VVCardsLayouts;
@interface VVHomeLayout : NSObject

@property (nonatomic, strong) VVCardsLayouts *cardsLayout;

+ (instancetype)map:(VVHomeModel *)homeModel;

@end

NS_ASSUME_NONNULL_END
