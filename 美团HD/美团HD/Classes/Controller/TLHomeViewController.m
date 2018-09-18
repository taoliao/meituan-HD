//
//  TLHomeViewController.m
//  美团HD
//
//  Created by corepress on 2018/8/15.
//  Copyright © 2018年 corepress. All rights reserved.
//

#import "TLHomeViewController.h"
#import "TLTopView.h"
#import "TLCategoryViewController.h"
#import "TLLocationViewController.h"
#import "TLCategory.h"
#import "TLLocation.h"
#import "TLConst.h"
#import "TLSortViewController.h"

@interface TLHomeViewController ()

/**/
@property(nonatomic,strong)UIBarButtonItem *categroyItem;
/**/
@property(nonatomic,strong)UIBarButtonItem *loctionItem;
/**/
@property(nonatomic,strong)UIBarButtonItem *sortItem;
/**/
@property(nonatomic,strong)TLCategoryViewController *categoryViewController;
/**/
@property(nonatomic,strong)TLLocationViewController *locationViewController;
/**/
@property(nonatomic,strong)TLSortViewController *sortViewController;

@end

@implementation TLHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupBarButtonItems];
    
    [self setupNoti];
}

- (void)setupNoti {
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(categorySelectNoti:) name:RLTableViewCilckNoti object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(locationSelctNoti:) name:RLTableViewCilckLoactionNoti object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(sortBtntNoti:) name:SortBtnCilckNoti object:nil];
}

- (void)categorySelectNoti:(NSNotification *)noti {
    
    NSDictionary *info = noti.userInfo;
    TLCategory *category = [info objectForKey:RLTableViewCilckNotiKey];
    NSString *subtitle = [info objectForKey:RLTableViewCilckNotiSubKey];
    
    TLTopView *categroyView = self.categroyItem.customView;
    [categroyView setTitle:category.name];
    [categroyView setIconImage:category.icon andHeightedImage:category.highlighted_icon];
    if (subtitle.length == 0) {
        [categroyView setSubTitles:@"全部"];
    }
    else {
        [categroyView setSubTitles:subtitle];
    }

    
}

- (void)locationSelctNoti:(NSNotification *)noti {
    
    NSDictionary *info = noti.userInfo;
    TLLocation *location = [info objectForKey:RLTableViewCilckLoactionNotiKey];
    NSString *subtitle = [info objectForKey:RLTableViewCilckLoactionNotiSubKey];
    TLTopView *locationView = self.loctionItem.customView;
    [locationView setTitle:location.name];
    if (subtitle.length == 0) {
        [locationView setSubTitles:@"全部区域"];
    }
    else {
        [locationView setSubTitles:subtitle];
    }
    
}

- (void)sortBtntNoti:(NSNotification *)noti {
    UIButton *sortBtn = noti.object;
    TLTopView *sortView = self.sortItem.customView;
    [sortView setSubTitles:sortBtn.titleLabel.text];

}


- (void)setupBarButtonItems {
    
    UIBarButtonItem *iconItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_meituan_logo"] style:UIBarButtonItemStyleDone target:nil action:nil];
    iconItem.enabled = NO;
    
    TLTopView *categroyView = [TLTopView topView];
    [categroyView setTitle:@"美团"];
    [categroyView setSubTitles:@"全部分类"];
    [categroyView setIconImage:@"icon_category_-1" andHeightedImage:@"icon_category_highlighted_-1"];
    [categroyView addTarget:self sel:@selector(categroyClick)];
    UIBarButtonItem *categroyItem = [[UIBarButtonItem alloc] initWithCustomView:categroyView];
    self.categroyItem = categroyItem;
    
    TLTopView *loctionView = [TLTopView topView];
    [loctionView setTitle:@"广州"];
    [loctionView setSubTitles:@"全部区域"];
    [loctionView setIconImage:@"icon_district" andHeightedImage:@"icon_district_highlighted"];
    [loctionView addTarget:self sel:@selector(locationClick)];
    UIBarButtonItem *loctionItem = [[UIBarButtonItem alloc] initWithCustomView:loctionView];
    self.loctionItem = loctionItem;
    
    TLTopView *sortView = [TLTopView topView];
    [sortView setTitle:@"排序"];
    [sortView setSubTitles:@"默认排序"];
    [sortView setIconImage:@"icon_sort" andHeightedImage:@"icon_sort_highlighted"];
     [sortView addTarget:self sel:@selector(sortClick)];
    UIBarButtonItem *sortItem = [[UIBarButtonItem alloc] initWithCustomView:sortView];
    self.sortItem = sortItem;
    
    self.navigationItem.leftBarButtonItems = @[iconItem,categroyItem,loctionItem,sortItem];
    
}

- (void)categroyClick {
    [_sortViewController dismissViewControllerAnimated:YES completion:nil];
    [_locationViewController dismissViewControllerAnimated:YES completion:nil];
    self.categoryViewController.popoverPresentationController.barButtonItem = self.categroyItem;
    [self presentViewController:self.categoryViewController animated:YES completion:nil];
}

- (void)locationClick {
    [_sortViewController dismissViewControllerAnimated:YES completion:nil];
    [_categoryViewController dismissViewControllerAnimated:YES completion:nil];
    self.locationViewController.popoverPresentationController.barButtonItem = self.loctionItem;
    [self presentViewController:self.locationViewController animated:YES completion:nil];
}

- (void)sortClick {
    [_categoryViewController dismissViewControllerAnimated:YES completion:nil];
    [_locationViewController dismissViewControllerAnimated:YES completion:nil];
    self.sortViewController.popoverPresentationController.barButtonItem = self.sortItem;
    [self presentViewController:self.sortViewController animated:YES completion:nil];
}

-(TLCategoryViewController *)categoryViewController {
    if (_categoryViewController == nil) {
        _categoryViewController = [[TLCategoryViewController alloc] init];
        _categoryViewController.modalPresentationStyle = UIModalPresentationPopover;
    }
    return _categoryViewController;
}
-(TLLocationViewController *)locationViewController {
    if (_locationViewController == nil) {
        _locationViewController = [[TLLocationViewController alloc] init];
        _locationViewController.modalPresentationStyle = UIModalPresentationPopover;
    }
    return _locationViewController;
}
- (TLSortViewController *)sortViewController {
    if (_sortViewController == nil) {
        _sortViewController = [[TLSortViewController alloc]init];
        _sortViewController.modalPresentationStyle = UIModalPresentationPopover;
    }
    return _sortViewController;
}
@end
