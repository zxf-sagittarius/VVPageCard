//
//  VVContainerProtocol.h
//  VVPageCard
//
//  Created by zxfei on 2020/7/13.
//

#ifndef VVContainerProtocol_h
#define VVContainerProtocol_h

@class VVCardsLayouts;
@protocol VVContainerProtocol <NSObject>

@property (nonatomic, strong) VVCardsLayouts * _Nullable cardsGroup;
- (void)loadDatasource:(VVCardsLayouts *_Nullable)cardsGroup;

- (void)registCard:(Class _Nonnull )card identifier:(nullable NSString *)identifier;

- (void)refresh;

- (void)refresh:(NSInteger)index;

@end

#endif /* VVContainerProtocol_h */
