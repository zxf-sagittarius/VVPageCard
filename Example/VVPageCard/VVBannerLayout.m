//
//  VVBannerLayout.m
//  VVPageCard_Example
//
//  Created by zxfei on 2020/7/15.
//  Copyright © 2020 zxfei. All rights reserved.
//

#import "VVBannerLayout.h"
#import "VVCardIdentifier.h"
#import "VVBannerInfo.h"

@implementation VVBannerLayout

@synthesize cardHeight, row,cardIdentifier,cardModel;

- (void)layout:(VVBannerInfo *)cardModel {
    self.cardIdentifier = VVCardIdentifier_banner;
    self.cardHeight = 64;
    self.cardModel = cardModel;
    
    if (cardModel.banners.count > 0) {
        self.cardHeight = ([UIScreen mainScreen].bounds.size.width - 60)/3.0 + 30;
    } else {
        self.cardHeight = 25;
    }
    
}
@end
