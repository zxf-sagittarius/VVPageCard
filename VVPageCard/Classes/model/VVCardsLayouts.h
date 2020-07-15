//
//  VVCardsLayouts.h
//  VVPageCard
//
//  Created by zxfei on 2020/7/14.
//

#import <Foundation/Foundation.h>
#import "VVCardLayoutProtocol.h"

NS_ASSUME_NONNULL_BEGIN

typedef  NSDictionary <NSString *, Class>  * _Nullable (^VVInjectCardMapBlock)(void);

@class VVCardsGroup;
@interface VVCardsLayouts : NSObject

// 提供 字典、数组 两种容器类型的 卡片集合
@property (nonatomic, strong, nullable) NSDictionary <NSString *,id<VVCardLayoutProtocol>> *cards;
@property (nonatomic, strong, nullable) NSArray <id <VVCardLayoutProtocol>> *cardsArray;

- (id <VVCardLayoutProtocol>)mapCardWithIdentifier:(NSString *)identifier;

+ (instancetype)map:(VVCardsGroup *)cardsGroup
    injectLayoutMap:(nullable VVInjectCardMapBlock)injectCardMapBlock;

@end

NS_ASSUME_NONNULL_END
