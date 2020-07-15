//
//  VVCardProtocol.h
//  VVPageCard
//
//  Created by zxfei on 2020/7/13.
//

#ifndef VVCardProtocol_h
#define VVCardProtocol_h

#import "VVCardLayoutProtocol.h"
@protocol VVCardProtocol <NSObject>

@optional
- (void)update:(id <VVCardLayoutProtocol>)model;

@end

#endif /* VVCardProtocol_h */
