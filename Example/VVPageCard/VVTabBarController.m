//
//  VVTabBarController.m
//  VVPageCard_Example
//
//  Created by zxfei on 2020/7/14.
//  Copyright © 2020 zxfei. All rights reserved.
//

#import "VVTabBarController.h"
#import "VVCollectionController.h"
#import "VVTableController.h"

@interface VVTabBarController ()

@property (nonatomic, strong) NSMutableArray *registerControllers;

@end

@implementation VVTabBarController


- (instancetype)init {
    if (self = [super init]) {
        
        _registerControllers = [NSMutableArray array];
        
        VVTableController *tableVC = [[VVTableController alloc] init];
        [self registerViewController:tableVC title:@"table" icon:nil arguments:nil];
        
        VVCollectionController *collectionVC = [[VVCollectionController alloc] init];
        [self registerViewController:collectionVC title:@"collection" icon:nil arguments:nil];
        self.viewControllers = self.registerControllers;
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}


- (void)registerViewController:(UIViewController *)vc title:(NSString *)title icon:(NSString *)icon arguments:(NSDictionary *)others {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    nav.tabBarItem.title = title;
    [self.registerControllers addObject:nav];
}

@end
