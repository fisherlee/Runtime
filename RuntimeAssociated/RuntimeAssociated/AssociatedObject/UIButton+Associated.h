//
//  UIButton+Associated.h
//  RuntimeAssociated
//
//  Created by liwei on 2017/2/22.
//  Copyright © 2017年 liwei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ActionBlock)();

@interface UIButton (Associated)

- (void)controlEvents:(UIControlEvents)controlEvents actionBlock:(ActionBlock)action;

@end
