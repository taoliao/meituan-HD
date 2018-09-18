//
//  TLTopView.h
//  美团HD
//
//  Created by corepress on 2018/8/15.
//  Copyright © 2018年 corepress. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface TLTopView : UIView

+(instancetype)topView;

- (void)setTitle:(NSString *)title;
- (void)setSubTitles:(NSString *)subtitle;
- (void)setIconImage:(NSString *)image andHeightedImage:(NSString *)heightedImage;

- (void)addTarget:(id)target sel:(SEL)action;

@end
