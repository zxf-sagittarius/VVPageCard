//
//  VVTableViewModel.m
//  VVPageCard_Example
//
//  Created by zxfei on 2020/7/15.
//  Copyright © 2020 zxfei. All rights reserved.
//

#import "VVTableViewModel.h"
#import "VVHomeModel.h"

@implementation VVTableViewModel

- (void)loadData:(void(^)(VVHomeLayout *layout))block  {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    VVHomeModel *homeModel = [VVHomeModel yy_modelWithJSON:dic];
    VVHomeLayout *layout = [VVHomeLayout map:homeModel];
    self.homeModel = homeModel;
    self.homelayout = layout;
    if (block) {
        block(layout);
    }
}

@end
