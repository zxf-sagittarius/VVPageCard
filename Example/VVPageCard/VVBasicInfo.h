//
//  VVBasicInfo.h
//  VVPageCard_Example
//
//  Created by zxfei on 2020/7/14.
//  Copyright © 2020 zxfei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VVCardModelProtocol.h"
#import "YYModel.h"
#import "VVImageInfo.h"

NS_ASSUME_NONNULL_BEGIN

@interface VVBasicInfo : NSObject <VVCardModelProtocol, YYModel>

@property (nonatomic, strong) NSArray <VVImageInfo *> *cards;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *type;

@end

NS_ASSUME_NONNULL_END
