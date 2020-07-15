//
//  VVTableViewModel.h
//  VVPageCard_Example
//
//  Created by zxfei on 2020/7/15.
//  Copyright © 2020 zxfei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VVHomeLayout.h"

NS_ASSUME_NONNULL_BEGIN
@class VVHomeModel;
@interface VVTableViewModel : NSObject

@property (nonatomic, strong) VVHomeModel *homeModel;

@property (nonatomic, strong) VVHomeLayout *homelayout;

- (void)loadData:(void(^)(VVHomeLayout *layout))block;

@end

NS_ASSUME_NONNULL_END
