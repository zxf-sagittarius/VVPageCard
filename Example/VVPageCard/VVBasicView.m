//
//  VVBasicView.m
//  VVPageCard_Example
//
//  Created by zxfei on 2020/7/15.
//  Copyright © 2020 zxfei. All rights reserved.
//

#import "VVBasicView.h"
#import "VVBasicInfo.h"
#import "UIView+FLFrame.h"
#import "VVBasicLayout.h"

@interface VVBasicView ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation VVBasicView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor redColor];
        [self setupSubviews];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.titleLabel.center = CGPointMake(self.width / 2.0, self.height / 2.0);
}

- (void)setupSubviews {
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
}

- (void)update:(VVBasicLayout <VVCardLayoutProtocol> *)model {
    
    NSLog(@"%@",model.cardIdentifier);
    
    
    VVBasicInfo *info = model.cardModel;
    if ([info isKindOfClass:[VVBasicInfo class]]) {
        self.titleLabel.text = [NSString stringWithFormat:@"%@_%@_%ld",model.cardIdentifier,info.title,(long)model.row];
    }
    
    
    
}

@end
