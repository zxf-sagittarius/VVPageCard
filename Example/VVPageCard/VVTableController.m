//
//  VVTableController.m
//  VVPageCard_Example
//
//  Created by zxfei on 2020/7/14.
//  Copyright © 2020 zxfei. All rights reserved.
//

#import "VVTableController.h"
#import "VVTableViewModel.h"
#import "VVBannerView.h"
#import "VVBasicView.h"
#import "VVCardIdentifier.h"

@interface VVTableController ()

@property (nonatomic, strong) VVTableViewModel *viewModel;

@end

@implementation VVTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadContainer:VVContainerTableType];
    [self registCard:[VVBannerView class] identifier:VVCardIdentifier_banner];
    [self registCard:[VVBasicView class] identifier:VVCardIdentifier_basic];
    
    self.viewModel = [[VVTableViewModel alloc] init];
    __weak typeof (self) weakSelf = self;
    [self.viewModel loadData:^(VVHomeLayout * _Nonnull layout) {
        __strong typeof (weakSelf) strongSelf = weakSelf;
        [strongSelf loadDatasource:layout.cardsLayout];
        [strongSelf refresh];
    }];
}



@end
