//
//  FirstViewController.m
//  RuntimeAssociated
//
//  Created by liwei on 2017/2/22.
//  Copyright © 2017年 liwei. All rights reserved.
//

#import "FirstViewController.h"
#import "UIButton+Associated.h"
#import <objc/runtime.h>

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)viewDidLayoutSubviews {
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"firstCellId" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"cell row %@", @(indexPath.row)];
    
    objc_setAssociatedObject(cell, @"kCellTextLabelKey", cell.textLabel.text, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *text = objc_getAssociatedObject(cell, @"kCellTextLabelKey");
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert"
                                                                             message:text
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAlert = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        objc_removeAssociatedObjects(cell);
    }];
    [alertController addAction:okAlert];

    
    [self presentViewController:alertController animated:YES completion:^{
        
    }];
}

@end
