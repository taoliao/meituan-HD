//
//  TLRightCell.m
//  美团HD
//
//  Created by corepress on 2018/8/16.
//  Copyright © 2018年 corepress. All rights reserved.
//

#import "TLRightCell.h"

@implementation TLRightCell

+(instancetype)rightCell:(UITableView *)tableView {
    static NSString *rightCel = @"rightCel";
    TLRightCell *cell = [tableView dequeueReusableCellWithIdentifier:rightCel];
    if (!cell) {
        cell = [[TLRightCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rightCel];
    }
    return cell;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_dropdown_leftpart"]];
        self.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_dropdown_left_selected"]];
    }
    return self;
}


@end
