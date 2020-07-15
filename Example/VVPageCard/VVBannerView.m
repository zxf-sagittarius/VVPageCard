//
//  VVBannerView.m
//  VVPageCard_Example
//
//  Created by zxfei on 2020/7/15.
//  Copyright © 2020 zxfei. All rights reserved.
//

#import "VVBannerView.h"
#import "VVBannerInfo.h"
#import "UIView+FLFrame.h"
#import "UIImageView+WebCache.h"


@interface VVBannerView ()

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIImageView *imagv;
@property (nonatomic, strong) UIImageView *imagv2;

@end

@implementation VVBannerView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blueColor];
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = [UIColor whiteColor];
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    UIImageView *imgv1 = [[UIImageView alloc] init];
    CGFloat width = (self.width - 60)/2;
    imgv1.size = CGSizeMake(width, width / 3 * 2);
    [self addSubview:imgv1];
    self.imagv = imgv1;
    
    UIImageView *imgv2 = [[UIImageView alloc] init];
    imgv2.size = CGSizeMake(width, width / 3 * 2);
    [self addSubview:imgv2];
    self.imagv2 = imgv2;
 }

- (void)layoutSubviews {
    [super layoutSubviews];
    self.titleLabel.centerX = self.width/2.0;
    self.titleLabel.top = 3;
    
    self.imagv.left = 20;
    self.imagv.top = self.titleLabel.bottom + 3;
    
    self.imagv2.right = self.width - 20;
    self.imagv2.top = self.imagv.top;
}

- (void)update:(id<VVCardLayoutProtocol>)model {
    
    NSLog(@"%@",model.cardIdentifier);
    
    VVBannerInfo *bannerInfo = model.cardModel;
    
    if ([bannerInfo isKindOfClass:[VVBannerInfo class]]) {
        self.titleLabel.text = [NSString stringWithFormat:@"%@_%@_%ld",bannerInfo.title,model.cardIdentifier,model.row];
        [self.titleLabel sizeToFit];
        
        if (bannerInfo.banners.count >= 1) {
            [self.imagv sd_setImageWithURL:[NSURL URLWithString:bannerInfo.banners[0].imageUrl]];
            self.imagv.hidden = NO;
        } else {
            self.imagv.hidden = YES;
        }
        
        if (bannerInfo.banners.count >= 2) {
            [self.imagv2 sd_setImageWithURL:[NSURL URLWithString:bannerInfo.banners[1].imageUrl]];
            self.imagv2.hidden = NO;
        } else {
            self.imagv2.hidden = YES;
        }
    }
}

@end
