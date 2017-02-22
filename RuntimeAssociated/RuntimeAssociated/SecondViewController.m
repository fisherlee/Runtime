//
//  SecondViewController.m
//  RuntimeAssociated
//
//  Created by liwei on 2017/2/22.
//  Copyright © 2017年 liwei. All rights reserved.
//

#import "SecondViewController.h"
#import "UIButton+Associated.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [_button controlEvents:UIControlEventTouchUpInside actionBlock:^{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert"
                                                                                 message:@"Button"
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAlert = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:okAlert];
        
        
        [self presentViewController:alertController animated:YES completion:nil];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
