//
//  TLRLTableView.m
//  美团HD
//
//  Created by corepress on 2018/8/15.
//  Copyright © 2018年 corepress. All rights reserved.
//

#import "TLRLTableView.h"
#import "TLLeftCell.h"
#import "TLRightCell.h"

@interface TLRLTableView()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *leftTableView;
@property (weak, nonatomic) IBOutlet UITableView *rightTableView;
/**/
@property(nonatomic,assign)NSInteger currentLeftRow;

@property(nonatomic,strong)NSArray *subData;

@end

@implementation TLRLTableView

+(instancetype)rlTableView {
    return [[[NSBundle mainBundle]loadNibNamed:@"TLRLTableView" owner:self options:nil] lastObject];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.leftTableView) {
        return [self.dataSource numberOfRowLeftTableView:tableView];
    }else {
        return self.subData.count;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = nil;
    if (tableView == self.leftTableView) {
        cell = [TLLeftCell leftCell:tableView];
        
        cell.textLabel.text = [self.dataSource titleOfleftTableView:tableView inRow:indexPath.row];
        
        if ([self.dataSource respondsToSelector:@selector(iconInLeftCell:inRow:)]) {
            NSString *icon = [self.dataSource iconInLeftCell:tableView inRow:indexPath.row];
            cell.imageView.image = [UIImage imageNamed:icon];
        }
        if ([self.dataSource respondsToSelector:@selector(heightedIconLeftCell:inRow:)]) {
            NSString *heightedIcon = [self.dataSource heightedIconLeftCell:tableView inRow:indexPath.row];
            cell.imageView.highlightedImage = [UIImage imageNamed:heightedIcon];
        }
    
    }else {
        cell = [TLRightCell rightCell:tableView];
        cell.textLabel.text = [self.subData objectAtIndex:indexPath.row];
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    if (tableView == self.leftTableView) {
        self.subData = [self.dataSource subDataOfLeftCell:tableView clickRow:indexPath.row];
        [self.rightTableView reloadData];
        
        if ([self.delegate respondsToSelector:@selector(leftTableViewClickOnRow:)]) {
            [self.delegate leftTableViewClickOnRow:indexPath.row];
             self.currentLeftRow = indexPath.row;
        }
        
    }else {
        
        if ([self.delegate respondsToSelector:@selector(leftTableViewClickinRow:clickRightTableViewInRow:)]) {
            [self.delegate leftTableViewClickinRow:self.currentLeftRow clickRightTableViewInRow:indexPath.row];
        }
        
    }
}

@end
