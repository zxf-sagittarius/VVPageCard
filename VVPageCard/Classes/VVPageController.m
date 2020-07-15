//
//  VVPageController.m
//  VVPageCard
//
//  Created by zxfei on 2020/7/13.
//

#import "VVPageController.h"
#import "VVTableView.h"
#import "VVDelegateProxy.h"
#import "VVCollectionView.h"

@interface VVPageController ()

@property (nonatomic, strong) UIView <VVContainerProtocol> *containerView;
@property (nonatomic, strong) VVDelegateProxy *proxy;

@end

@implementation VVPageController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)dealloc {
    _proxy = nil;
}

- (void)loadContainer:(VVContainerType)type {
    
    if (self.containerView) {
        [self.containerView removeFromSuperview];
        self.proxy = nil;
    }
    
    if (type == VVContainerTableType) {
        [self setupTable];
    }
}

- (void)setupTable {
    VVTableView *table = [[VVTableView alloc] initWithFrame:self.view.bounds];
    VVDelegateProxy *proxy = [[VVDelegateProxy alloc] initWithProtocol:@protocol(UITableViewDelegate)];
    [proxy addDelegate:table];
    [proxy addDelegate:self];
    table.delegate = (id<UITableViewDelegate>)proxy;
    [self.view addSubview:table];
    self.containerView = table;
    self.proxy = proxy;
    
}

- (void)setupCollection {
    
}

#pragma maek -- VVContainerProtocol

@synthesize cardsGroup;

- (void)loadDatasource:(VVCardsLayouts *_Nullable)cardsGroup {
    [self.containerView loadDatasource:cardsGroup];
}

- (void)registCard:(Class _Nonnull )card identifier:(nullable NSString *)identifier {
    [self.containerView registCard:card identifier:identifier];
}

- (void)refresh {
    [self.containerView refresh];
}

- (void)refresh:(NSInteger)index {
    [self.containerView refresh:index];
}

@end
