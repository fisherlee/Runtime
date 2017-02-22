//
//  UIButton+Associated.m
//  RuntimeAssociated
//
//  Created by liwei on 2017/2/22.
//  Copyright © 2017年 liwei. All rights reserved.
//

#import "UIButton+Associated.h"
#import <objc/runtime.h>

static char buttonAssociatedKey;

@implementation UIButton (Associated)

- (void)controlEvents:(UIControlEvents)controlEvents actionBlock:(ActionBlock)action {
    objc_setAssociatedObject(self, &buttonAssociatedKey, action, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self addTarget:self action:@selector(callActionBlock:) forControlEvents:controlEvents];
}

- (void)callActionBlock:(id)sender {
    ActionBlock block = objc_getAssociatedObject(self, &buttonAssociatedKey);
    if (block) {
        block();
    }
}

@end
