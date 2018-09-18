//
//  TLLocationViewController.m
//  美团HD
//
//  Created by corepress on 2018/8/15.
//  Copyright © 2018年 corepress. All rights reserved.
//

#import "TLLocationViewController.h"
#import "TLRLTableView.h"
#import "TLCategory.h"
#import "TLLocation.h"
#import "MJExtension.h"
#import "TLConst.h"

@interface TLLocationViewController ()<TLRLTableViewDataSource,TLRLTableViewDelegate>
/**/
@property(nonatomic,strong)NSArray *locationData;
@end

@implementation TLLocationViewController

- (NSArray *)locationData {
    if (_locationData == nil) {
        _locationData = [TLLocation objectArrayWithFilename:@"gz.plist"];
    }
    return _locationData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
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
    return self.locationData.count;
}
- (NSString *)titleOfleftTableView:(UITableView *)tableView inRow:(NSInteger)row {
    TLLocation *location = self.locationData[row];
    return location.name;
}
- (NSArray *)subDataOfLeftCell:(UITableView *)tableView clickRow:(NSInteger)row {
    TLLocation *location = self.locationData[row];
    return location.subregions;
}
#pragma mark TLRLTableViewDelegate
- (void)leftTableViewClickOnRow:(NSInteger)row {
    
    TLLocation *location = [self.locationData objectAtIndex:row];
    
    NSDictionary *info = @{RLTableViewCilckLoactionNotiKey : location};
    
    [[NSNotificationCenter defaultCenter] postNotificationName:RLTableViewCilckLoactionNoti object:nil userInfo:info];
    
    if (location.subregions.count == 0) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)leftTableViewClickinRow:(NSInteger)leftRow clickRightTableViewInRow:(NSInteger)rightRow {
    
    TLLocation *location = [self.locationData objectAtIndex:leftRow];
    
    NSString *subtitle = [location.subregions objectAtIndex:rightRow];
    
    NSDictionary *info = @{RLTableViewCilckLoactionNotiKey : location,RLTableViewCilckLoactionNotiSubKey : subtitle};
    
    [[NSNotificationCenter defaultCenter] postNotificationName:RLTableViewCilckLoactionNoti object:nil userInfo:info];
    
     [self dismissViewControllerAnimated:YES completion:nil];
}
@end
