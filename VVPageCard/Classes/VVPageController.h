//
//  VVPageController.h
//  VVPageCard
//
//  Created by zxfei on 2020/7/13.
//

#import <UIKit/UIKit.h>
#import "VVContainerProtocol.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, VVContainerType) {
    
    VVContainerTableType,
    VVContainerCollectionType,
    VVContainerTypeReserved_1,
    VVContainerTypeReserved_2,
    VVContainerTypeReserved_3
};

@interface VVPageController : UIViewController <VVContainerProtocol>

- (void)loadContainer:(VVContainerType)type;

@end

NS_ASSUME_NONNULL_END