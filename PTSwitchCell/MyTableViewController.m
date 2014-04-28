//
//  MyTableViewController.m
//  PTSwitchCell
//
//  Created by Phillip Harris on 4/28/14.
//  Copyright (c) 2014 Phillip Harris. All rights reserved.
//

#import "MyTableViewController.h"

#import "PTSwitchCell.h"

@interface MyTableViewController () <PTSwitchCellDelegate>

@end

@implementation MyTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Option A: Register the class.
    [self.tableView registerClass:[PTSwitchCell class] forCellReuseIdentifier:PTSwitchCellReuseIdentifier];
    
    // Option B: Register the Nib.
//    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([PTSwitchCell class]) bundle:nil] forCellReuseIdentifier:PTSwitchCellReuseIdentifier];
}

//===============================================
#pragma mark -
#pragma mark UITableViewDataSource
//===============================================

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PTSwitchCell *cell = [tableView dequeueReusableCellWithIdentifier:PTSwitchCellReuseIdentifier forIndexPath:indexPath];
    
    cell.delegate = self;
    
    NSString *userDefaultsBoolKey = [NSString stringWithFormat:@"Feature %i", indexPath.row + 1];
    
    cell.userDefaultsBoolKey = userDefaultsBoolKey;
    
    cell.textLabel.text = userDefaultsBoolKey;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    PTSwitchCell *cell = (PTSwitchCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    [cell toggleTheSwitch];
}

//===============================================
#pragma mark -
#pragma mark PTSwitchCellDelegate
//===============================================

- (void)switchCellValueDidChange:(PTSwitchCell *)cell {
    
    NSLog(@"MyTableViewController | switchCellValueDidChange");
}

@end
