//
//  VVCardsLayouts.m
//  VVPageCard
//
//  Created by zxfei on 2020/7/14.
//

#import "VVCardsLayouts.h"
#import "VVCardsGroup.h"

@implementation VVCardsLayouts

+ (instancetype)map:(VVCardsGroup *)cardsGroup
    injectLayoutMap:(nullable VVInjectCardMapBlock)injectCardMapBlock {
    
    if (injectCardMapBlock) {
        
        NSMutableDictionary *cardsDictionary = [NSMutableDictionary dictionary];
        NSMutableArray *cardsArray = [NSMutableArray array];
        VVCardsLayouts *layouts = [[VVCardsLayouts alloc] init];
        NSDictionary <NSString *, Class> *map = injectCardMapBlock();
        
        for (int i = 0; i < cardsGroup.cardsArray.count; i ++) {
            
            id <VVCardModelProtocol> model = cardsGroup.cardsArray[i];
            
            NSString *modelType = [model.class modelType];
            
            Class class = [map objectForKey: modelType];
            if (class) {
                id <VVCardLayoutProtocol> card = nil;
                if ([class conformsToProtocol:@protocol(VVCardLayoutProtocol)]) {
                    card = [[class alloc] init];
                    card.row = i;
                    if ([card respondsToSelector:@selector(layout:)]) {
                        [card layout:model];
                    } else {
                        card = nil;
                    }
                }
                
                if (card) {
                    [cardsDictionary setValue:card forKey:modelType];
                    [cardsArray addObject:card];
                }
            }
        }
        if (cardsDictionary.count > 0) {
            layouts.cards = cardsDictionary;
            layouts.cardsArray = cardsArray;
        }
        return layouts;
    }
    return nil;
}

- (id <VVCardLayoutProtocol>)mapCardWithIdentifier:(NSString *)identifier {
    
    if (nil == identifier ||
        0 == identifier.length ||
        nil == self.cards) {
        return nil;
    }
    return [self.cards objectForKey:identifier];
}

@end
