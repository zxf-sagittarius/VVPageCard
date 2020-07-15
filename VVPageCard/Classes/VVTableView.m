//
//  VVTableView.m
//  VVPageCard
//
//  Created by zxfei on 2020/7/13.
//

#import "VVTableView.h"
#import "VVCardsHelper.h"
#import "VVDefalutTableCard.h"
#import "VVCardsGroup.h"
#import "VVCardsLayouts.h"

#define VVTag  999

@interface VVTableView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) VVCardsHelper *cardsHelper;

@end

@implementation VVTableView

- (instancetype)init {
    if (self = [super init]) {
        [self config];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self config];
    }
    return self;
}

- (void)config {
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.separatorColor = [UIColor clearColor];
    self.dataSource = self;
    self.delegate = self;
    self.cardsHelper = [[VVCardsHelper alloc] init];
}

- (NSInteger)numberOfSections {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cardsGroup.cardsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell <VVCardProtocol> *cell = nil;
    id <VVCardLayoutProtocol> card = [self cardAtIndex:indexPath];
    if (card) {
        cell = [tableView dequeueReusableCellWithIdentifier:card.cardIdentifier];
        UIView <VVCardProtocol> *subview = [cell.contentView viewWithTag:VVTag];
        if (subview) {
            subview.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), card.cardHeight);
        }
        if (!cell) {
            cell = [[VVDefalutTableCard alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:card.cardIdentifier];
            Class viewClass = [self.cardsHelper cardWithIdentifier:card.cardIdentifier];
            if (![subview isKindOfClass:viewClass]) {
                [subview removeFromSuperview];
                subview = nil;
            }
            if (!subview) {
                subview = [[viewClass alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), card.cardHeight)];
                subview.tag = VVTag;
                subview.accessibilityIdentifier = card.cardIdentifier;
                [cell.contentView addSubview:subview];
            }
        }
        if ([cell conformsToProtocol:@protocol(VVCardProtocol)] && [cell respondsToSelector:@selector(update:)]) {
            [cell update:card];
        }
        if ([subview conformsToProtocol:@protocol(VVCardProtocol)] && [subview respondsToSelector:@selector(update:)]) {
            [subview update:card];
        }
    }
    if (!cell) {
        cell = [[VVDefalutTableCard alloc] init];
    }
    return cell;
}

- (id <VVCardLayoutProtocol>)cardAtIndex:(NSIndexPath *)index {
    NSInteger row = index.row;
    NSArray <id <VVCardLayoutProtocol>> *cards = self.cardsGroup.cardsArray;
    if (row < cards.count) {
       return cards[row];
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    id <VVCardLayoutProtocol> card = [self cardAtIndex:indexPath];
    return card.cardHeight;
}

#pragma mark -- VVContainerProtocol
@synthesize cardsGroup;
- (void)loadDatasource:(VVCardsLayouts *_Nullable)cardsGroup {
    self.cardsGroup = cardsGroup;
}

- (void)registCard:(Class _Nonnull )card identifier:(nullable NSString *)identifier {
    NSString *iden = identifier ? identifier : NSStringFromClass(card);
    [self.cardsHelper registCard:card identifier:iden];
    if ([card isKindOfClass:[UITableViewCell class]]) {
        [self registerClass:card forCellReuseIdentifier:iden];
    }
}
- (void)refresh {
    [UIView performWithoutAnimation:^{
        [self reloadData];
    }];
}

- (void)refresh:(NSInteger)index {
    if (index > 0 && index < self.cardsGroup.cardsArray.count) {
        [UIView performWithoutAnimation:^{
            [self reloadSections:[NSIndexSet indexSetWithIndex:index] withRowAnimation:UITableViewRowAnimationNone];
        }];
    }
}
@end
