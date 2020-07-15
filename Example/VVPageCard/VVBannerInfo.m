//
//  VVBannerInfo.m
//  VVPageCard_Example
//
//  Created by zxfei on 2020/7/14.
//  Copyright © 2020 zxfei. All rights reserved.
//

#import "VVBannerInfo.h"
#import "VVHomeModelType.h"

@implementation VVBannerInfo

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{
        @"banners" : [VVImageInfo class]
    };
}

+ (NSString *)modelType {
    return VVHomeModelTypeBanner;
}

@end
