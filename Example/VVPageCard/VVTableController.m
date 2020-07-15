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
#import "VVBus.h"
#import "VVTestEventDefine.h"
#import "VVHomeModel.h"
#import "SVProgressHUD.h"

@interface VVTableController () <UITableViewDelegate>

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
    
    
    [self registCallbacks];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"%ld",indexPath.row);
    
}


- (void)registCallbacks {
    [self.bus registAction:^VVDisposable * _Nullable(id<VVActionReporter>  _Nonnull reporter) {
        VVEvent *event = reporter.event;
        VVBannerView*view = (VVBannerView *)event.poster;
        VVBannerInfo *bannerInfo = (VVBannerInfo *)view.cardLayout.cardModel;
        NSString *param = event.params[@"index"];
        NSString *info = [NSString stringWithFormat:@"可以传递的信息\n%@_%ld\n%@\n%@",view.cardLayout.cardIdentifier,view.cardLayout.row,bannerInfo.title,param];
        [SVProgressHUD showSuccessWithStatus:info];
        [reporter reportCompleted];
        return nil;
    } onEvent:VVEventType_Banner];
}

@end
