//
//  VVCardProtocol.h
//  VVPageCard
//
//  Created by zxfei on 2020/7/13.
//

#ifndef VVCardProtocol_h
#define VVCardProtocol_h

#import "VVCardLayoutProtocol.h"
@class VVBus;
@protocol VVCardProtocol <NSObject>

@optional

@property (nonatomic, weak) VVBus *bus;
@property (nonatomic, strong) id <VVCardLayoutProtocol> cardLayout;
- (void)update:(id <VVCardLayoutProtocol>)model;

@end

#endif /* VVCardProtocol_h */
