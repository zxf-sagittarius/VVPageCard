//
//  VVCardsGroup.m
//  VVPageCard
//
//  Created by zxfei on 2020/7/14.
//

#import "VVCardsGroup.h"
#import "YYModel.h"

@implementation VVCardsGroup

+ (instancetype)modelWithJson:(NSArray *)jsonArray
     injectCardsIdentifierKey:(nullable NSString *)key
               injectCardsMap:(nullable NSDictionary <NSString *, Class>  * _Nullable (^)(void))injectCardMapBlock {
    
    if (jsonArray == nil ||
        [jsonArray isKindOfClass:[NSArray class]] == NO ||
        jsonArray.count == 0) {
        return nil;
    }

    VVCardsGroup *cards = [[VVCardsGroup alloc] init];
    [cards injectJson:jsonArray injectCardsIdentifierKey:key injectCardsMap:injectCardMapBlock];
    return cards;
}


- (instancetype)injectJson:(NSArray *)jsonArray
  injectCardsIdentifierKey:(nullable NSString *)key
            injectCardsMap:(nullable VVInjectCardMapBlock)injectCardMapBlock {
    
    NSString *identifierKey = (key && key.length > 0) ? key : @"type";
        if (injectCardMapBlock) {
            NSDictionary <NSString *, Class> *map = injectCardMapBlock();
            
            NSMutableDictionary *cardsDictionary = [NSMutableDictionary dictionary];
            NSMutableArray *cardsArray = [NSMutableArray array];
            
            for (int i = 0; i < jsonArray.count; i ++) {
                
                NSDictionary *json = jsonArray[i];
                NSString *cardKey = [json objectForKey:identifierKey];
                if (![cardKey isKindOfClass:[NSString class]] || cardKey.length == 0) {
                    continue;
                }
                NSString *cardIdentifier = [json objectForKey:identifierKey];
                Class class = [map objectForKey: cardIdentifier];
                if (class) {
                    id <VVCardModelProtocol> card = nil;
                    if ([class conformsToProtocol:@protocol(YYModel)]) {
                        card = [class yy_modelWithJSON:json];
                    } else if ([class conformsToProtocol:@protocol(VVCardModelProtocol)]) {
                        card = [class modelWithJson:json];
                    }
                    
                    if (card) {
                        [cardsDictionary setValue:card forKey:cardKey];
                        [cardsArray addObject:card];
                    }
                }
            }
            if (cardsDictionary.count > 0) {
                self.cards = cardsDictionary;
                self.cardsArray = cardsArray;
            }
        }
    return self;
}


- (id <VVCardModelProtocol>)mapCardWithIdentifier:(NSString *)identifier {
    
    if (nil == identifier ||
        0 == identifier.length ||
        nil == self.cards) {
        return nil;
    }
    return [self.cards objectForKey:identifier];
}

@end
