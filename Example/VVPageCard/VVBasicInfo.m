//
//  VVBasicInfo.m
//  VVPageCard_Example
//
//  Created by zxfei on 2020/7/14.
//  Copyright © 2020 zxfei. All rights reserved.
//

#import "VVBasicInfo.h"
#import "VVHomeModelType.h"

@implementation VVBasicInfo

+ (NSString *)modelType {
    return VVHomeModelTypeBasic;
}

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{
        @"cards" : [VVImageInfo class]
    };
}

@end
