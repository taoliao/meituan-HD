//
//  TLTopView.m
//  美团HD
//
//  Created by corepress on 2018/8/15.
//  Copyright © 2018年 corepress. All rights reserved.
//

#import "TLTopView.h"

@interface TLTopView()
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *subTitle;
@property (weak, nonatomic) IBOutlet UIButton *iconBtn;

@end

@implementation TLTopView
+(instancetype)topView {
    
    return [[[NSBundle mainBundle]loadNibNamed:@"TLTopView" owner:self options:nil] lastObject];
    
}
- (void)setTitle:(NSString *)title {
    self.titleLable.text = title;
}
- (void)setSubTitles:(NSString *)subtitle {
    self.subTitle.text = subtitle;
}
- (void)setIconImage:(NSString *)image andHeightedImage:(NSString *)heightedImage {
    [self.iconBtn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [self.iconBtn setImage:[UIImage imageNamed:heightedImage] forState:UIControlStateHighlighted];
}

- (void)addTarget:(id)target sel:(SEL)action {
    [self.iconBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}
@end
