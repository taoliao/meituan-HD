//
//  TLRLTableView.h
//  美团HD
//
//  Created by corepress on 2018/8/15.
//  Copyright © 2018年 corepress. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TLRLTableViewDataSource<NSObject>
@required
//左边多少行
-(NSInteger)numberOfRowLeftTableView:(UITableView *)tableView;
//左边cell显示title
-(NSString *)titleOfleftTableView:(UITableView *)tableView inRow:(NSInteger)row;
//右边子数据
-(NSArray *)subDataOfLeftCell:(UITableView *)tableView clickRow:(NSInteger)row;
@optional
//左边图标
-(NSString *)iconInLeftCell:(UITableView *)tableView inRow:(NSInteger)row;
//左边高亮图标
- (NSString *)heightedIconLeftCell:(UITableView *)tableView inRow:(NSInteger)row;
@end

@protocol TLRLTableViewDelegate<NSObject>

@optional
//点击左边哪一行
-(void)leftTableViewClickOnRow:(NSInteger)row;
//点击左边哪一行 右边哪一行
-(void)leftTableViewClickinRow:(NSInteger)leftRow clickRightTableViewInRow:(NSInteger)rightRow;
@end

@interface TLRLTableView : UIView

+(instancetype)rlTableView;

/**/
@property(nonatomic,weak)id<TLRLTableViewDataSource>dataSource;
/**/
@property(nonatomic,weak)id<TLRLTableViewDelegate>delegate;

@end
