//
//  VVHomeModel.h
//  VVPageCard_Example
//
//  Created by zxfei on 2020/7/14.
//  Copyright © 2020 zxfei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VVCardsGroup.h"
#import "YYModel.h"
#import "VVBasicInfo.h"
#import "VVBannerInfo.h"

NS_ASSUME_NONNULL_BEGIN

@interface VVHomeModel : NSObject <YYModel>

@property (nonatomic, strong) VVCardsGroup *cardsGroup;


@property (nonatomic, strong) VVBasicInfo *basicInfo;
@property (nonatomic, strong) VVBannerInfo *bannerInfo;

@end




NS_ASSUME_NONNULL_END
