//
//  VVBasicLayout.m
//  VVPageCard_Example
//
//  Created by zxfei on 2020/7/15.
//  Copyright © 2020 zxfei. All rights reserved.
//

#import "VVBasicLayout.h"
#import "VVCardIdentifier.h"

@implementation VVBasicLayout

@synthesize cardHeight, row,cardIdentifier,cardModel;

- (void)layout:(id<VVCardModelProtocol>)cardModel {
    
    self.cardIdentifier = VVCardIdentifier_basic;
    self.cardHeight = 80;
    self.cardModel = cardModel;
}

@end
