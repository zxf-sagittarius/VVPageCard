//
//  VVCardsGroup.h
//  VVPageCard
//
//  Created by zxfei on 2020/7/14.
//

#import <Foundation/Foundation.h>
#import "VVCardModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN

#define CardOutput(wrap,identifier)  ([wrap isKindOfClass:[VVCardsGroup class]] ? [wrap mapCardWithIdentifier:identifier] : nil)

typedef  NSDictionary <NSString *, Class>  * _Nullable (^VVInjectCardMapBlock)(void);

@interface VVCardsGroup : NSObject

// 提供 字典、数组 两种容器类型的 卡片集合
@property (nonatomic, strong, nullable) NSDictionary <NSString *,id<VVCardModelProtocol>> *cards;
@property (nonatomic, strong, nullable) NSArray <id <VVCardModelProtocol>> *cardsArray;


+ (instancetype)modelWithJson:(NSArray *)jsonArray
     injectCardsIdentifierKey:(nullable NSString *)key
               injectCardsMap:(nullable VVInjectCardMapBlock)injectCardMapBlock;

- (id <VVCardModelProtocol>)mapCardWithIdentifier:(NSString *)identifier;

@end

NS_ASSUME_NONNULL_END
