//
//  TLCategoryViewController.m
//  美团HD
//
//  Created by corepress on 2018/8/15.
//  Copyright © 2018年 corepress. All rights reserved.
//

#import "TLCategoryViewController.h"
#import "TLRLTableView.h"
#import "TLCategory.h"
#import "TLLocation.h"
#import "MJExtension.h"
#import "TLConst.h"
@interface TLCategoryViewController ()<TLRLTableViewDataSource,TLRLTableViewDelegate>
/**/
@property(nonatomic,strong) NSArray *categoryData;
@end

@implementation TLCategoryViewController
- (NSArray *)categoryData {
    if (_categoryData == nil) {
        _categoryData = [TLCategory objectArrayWithFilename:@"categories.plist"];
    }
    return _categoryData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    [self setupRLTableView];
}

- (void)setupRLTableView{
    TLRLTableView *rlTableView = [TLRLTableView rlTableView];
    rlTableView.dataSource = self;
    rlTableView.delegate = self;
    [self.view addSubview:rlTableView];
    rlTableView.frame = self.view.bounds;
    rlTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
}

#pragma mark TLRLTableViewDataSource
- (NSInteger)numberOfRowLeftTableView:(UITableView *)tableView {
    return self.categoryData.count;
}
- (NSString *)titleOfleftTableView:(UITableView *)tableView inRow:(NSInteger)row {
    TLCategory *category = self.categoryData[row];
    return category.name;
}
- (NSArray *)subDataOfLeftCell:(UITableView *)tableView clickRow:(NSInteger)row {
     TLCategory *category = self.categoryData[row];
    return category.subcategories;
}
- (NSString *)iconInLeftCell:(UITableView *)tableView inRow:(NSInteger)row {
     TLCategory *category = self.categoryData[row];
    return category.small_icon;
}
- (NSString *)heightedIconLeftCell:(UITableView *)tableView inRow:(NSInteger)row {
    TLCategory *category = self.categoryData[row];
    return category.small_highlighted_icon;
}
#pragma mark TLRLTableViewDelegate
- (void)leftTableViewClickOnRow:(NSInteger)row {
    
    TLCategory *category = [self.categoryData objectAtIndex:row];
    
    NSDictionary *info = @{RLTableViewCilckNotiKey : category};
    
    [[NSNotificationCenter defaultCenter] postNotificationName:RLTableViewCilckNoti object:nil userInfo:info];
    
    if (category.subcategories.count == 0) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
}

- (void)leftTableViewClickinRow:(NSInteger)leftRow clickRightTableViewInRow:(NSInteger)rightRow {
    
    TLCategory *category = [self.categoryData objectAtIndex:leftRow];
    
    NSString *subtitle = [category.subcategories objectAtIndex:rightRow];
    
    NSDictionary *info = @{RLTableViewCilckNotiKey : category,RLTableViewCilckNotiSubKey : subtitle};
    
    [[NSNotificationCenter defaultCenter] postNotificationName:RLTableViewCilckNoti object:nil userInfo:info];
    
     [self dismissViewControllerAnimated:YES completion:nil];
}


@end
