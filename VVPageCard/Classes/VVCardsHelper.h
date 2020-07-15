//
//  VVCardsHelper.h
//  VVPageCard
//
//  Created by zxfei on 2020/7/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface VVCardsHelper : NSObject

- (Class)cardWithIdentifier:(nonnull NSString *)identifier;

- (void)registCard:(Class _Nonnull )card identifier:(nullable NSString *)identifier;

@end

NS_ASSUME_NONNULL_END
