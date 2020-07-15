//
//  VVHomeModel.m
//  VVPageCard_Example
//
//  Created by zxfei on 2020/7/14.
//  Copyright © 2020 zxfei. All rights reserved.
//

#import "VVHomeModel.h"
#import "VVCardsGroup.h"


@implementation VVHomeModel

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    
    if (dic && [dic isKindOfClass:[NSDictionary class]]) {
        NSArray *cards = [dic objectForKey:@"data"];
        if ([cards isKindOfClass:[NSArray class]]) {
            VVCardsGroup *cardsGroup = [VVCardsGroup modelWithJson:cards injectCardsIdentifierKey:@"type" injectCardsMap:^NSDictionary<NSString *,Class> * _Nullable{
                return @{
                    [VVBasicInfo modelType] : [VVBasicInfo class],
                    [VVBannerInfo modelType] : [VVBannerInfo class],
                };
            }];
            self.cardsGroup = cardsGroup;
            self.basicInfo = CardOutput(cardsGroup, [VVBasicInfo modelType]);
            self.bannerInfo = CardOutput(cardsGroup, [VVBannerInfo modelType]);
        }
    }
    return YES;
}

@end

