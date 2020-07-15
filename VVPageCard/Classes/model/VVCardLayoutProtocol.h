//
//  VVCardLayoutProtocol.h
//  VVPageCard
//
//  Created by zxfei on 2020/7/14.
//

#ifndef VVCardLayoutProtocol_h
#define VVCardLayoutProtocol_h

#import "VVCardModelProtocol.h"

@protocol VVCardLayoutProtocol <NSObject>

@required
@property (nonatomic, assign) CGFloat cardHeight;
@property (nonatomic, copy) NSString *cardIdentifier;// 映射card view


@optional
@property (nonatomic, strong) id cardModel; // 数据模型
@property (nonatomic, assign) NSInteger row;
- (BOOL)isValid;
- (void)layout:(id <VVCardModelProtocol>)cardModel;

@end

#endif /* VVCardLayoutProtocol_h */
