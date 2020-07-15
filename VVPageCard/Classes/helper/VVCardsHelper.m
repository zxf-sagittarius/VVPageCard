//
//  VVCardsHelper.m
//  VVPageCard
//
//  Created by zxfei on 2020/7/14.
//

#import "VVCardsHelper.h"

@interface VVCardsHelper ()

@property (nonatomic, strong) NSMutableDictionary *cards;

@end

@implementation VVCardsHelper

- (instancetype)init {
    if (self = [super init]) {
        _cards = @{}.mutableCopy;
    }
    return self;
}

- (Class)cardWithIdentifier:(nonnull NSString *)identifier {
    return [self.cards valueForKey:identifier];
}

- (void)registCard:(Class _Nonnull )card identifier:(nullable NSString *)identifier {
    [self.cards setValue:card forKey:identifier];
}

@end
