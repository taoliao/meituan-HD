//
//  TLLeftCell.m
//  美团HD
//
//  Created by corepress on 2018/8/16.
//  Copyright © 2018年 corepress. All rights reserved.
//

#import "TLLeftCell.h"

@implementation TLLeftCell

+(instancetype)leftCell:(UITableView *)tableView {
    static NSString *leftCel = @"leftCel";
    TLLeftCell *cell = [tableView dequeueReusableCellWithIdentifier:leftCel];
    if (!cell) {
        cell = [[TLLeftCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:leftCel];
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
