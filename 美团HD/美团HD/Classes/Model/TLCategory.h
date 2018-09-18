//
//  TLCategory.h
//  美团HD
//
//  Created by corepress on 2018/8/15.
//  Copyright © 2018年 corepress. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLCategory : NSObject

@property(nonatomic,copy) NSString *highlighted_icon;
@property(nonatomic,copy) NSString *icon;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *small_highlighted_icon;
@property(nonatomic,copy) NSString *small_icon;
@property(nonatomic,copy) NSString *map_icon;
/**/
@property(nonatomic,strong)NSArray *subcategories;
@end
