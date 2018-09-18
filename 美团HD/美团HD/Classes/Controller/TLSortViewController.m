//
//  TLSortViewController.m
//  美团HD
//
//  Created by corepress on 2018/8/16.
//  Copyright © 2018年 corepress. All rights reserved.
//

#import "TLSortViewController.h"
#import "TLSort.h"
#import "MJExtension.h"
#import "TLConst.h"

@interface TLSortViewController ()

/**/
@property(nonatomic,strong)NSArray *sortData;
/**/
@property(nonatomic,strong)UIButton *selectBtn;

@end

@implementation TLSortViewController

-(NSArray *)sortData {
    if (_sortData == nil) {
        _sortData = [TLSort objectArrayWithFilename:@"sorts.plist"];
    }
    return _sortData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
 
    [self setupSortBtn];
}

- (void)setupSortBtn {
    
    NSInteger btnCount = self.sortData.count;
    
    CGFloat btnWidth = 140.0;
    CGFloat btnHeight = 40;
    CGFloat topMargin = 10;
    CGFloat margin = 20;
    
    for (int i=0; i<btnCount; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        TLSort *sort = self.sortData[i];
        [btn setTitle:sort.label forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"btn_filter_normal"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"btn_filter_selected"] forState:UIControlStateSelected];
        btn.frame = CGRectMake(margin, (btnHeight+topMargin)*i+topMargin, btnWidth, btnHeight);
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
    self.preferredContentSize = CGSizeMake(btnWidth+2*margin, (btnHeight+topMargin)*btnCount+topMargin);
}

- (void)btnClick:(UIButton *)btn {
    
    self.selectBtn.selected = NO;
    
    self.selectBtn = btn;
    self.selectBtn.selected = YES;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:SortBtnCilckNoti object:self.selectBtn];
    
     [self dismissViewControllerAnimated:YES completion:nil];
}


@end
