//
//  VVCardModelProtocol.h
//  YYModel
//
//  Created by zxfei on 2020/7/14.
//

#ifndef VVCardModelProtocol_h
#define VVCardModelProtocol_h

@protocol VVCardModelProtocol <NSObject>

@required
+ (NSString *)modelType; // 解析model

@optional
+ (instancetype)modelWithJson:(id)json;

@end


#endif /* VVCardModelProtocol_h */
