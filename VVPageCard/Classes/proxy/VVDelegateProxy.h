//
//  VVDelegateProxy.h
//  VVPageCard
//
//  Created by zxfei on 2020/7/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface VVDelegateProxy : NSObject

- (instancetype)initWithProtocol:(Protocol *)protocol;

- (void)addDelegate:(id)delegate;

@end

NS_ASSUME_NONNULL_END
