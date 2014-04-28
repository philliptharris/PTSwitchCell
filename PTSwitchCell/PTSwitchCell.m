//
//  PTSwitchCell.m
//  PTSwitchCell
//
//  Created by Phillip Harris on 4/28/14.
//  Copyright (c) 2014 Phillip Harris. All rights reserved.
//

#import "PTSwitchCell.h"

NSString * const PTSwitchCellReuseIdentifier = @"PTSwitchCellReuseIdentifier";

@implementation PTSwitchCell

//===============================================
#pragma mark -
#pragma mark Initialization
//===============================================

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
    }
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _theSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
        [_theSwitch sizeToFit];
        [_theSwitch addTarget:self action:@selector(switchValueDidChange:) forControlEvents:UIControlEventValueChanged];
        self.accessoryView = _theSwitch;
    }
    return self;
}

//===============================================
#pragma mark -
#pragma mark Setters
//===============================================

- (void)setUserDefaultsBoolKey:(NSString *)userDefaultsBoolKey {
    
    _userDefaultsBoolKey = userDefaultsBoolKey;
    
    [self.theSwitch setOn:[[NSUserDefaults standardUserDefaults] boolForKey:userDefaultsBoolKey] animated:NO];
}

//===============================================
#pragma mark -
#pragma mark Switch State
//===============================================

- (IBAction)switchValueDidChange:(id)sender {
    
    NSLog(@"PTSwitchCell | switchValueDidChange");
    
    if ([self.delegate respondsToSelector:@selector(switchCellValueDidChange:)]) {
        [self.delegate switchCellValueDidChange:self];
    }
    
    if (self.userDefaultsBoolKey) {
        [[NSUserDefaults standardUserDefaults] setBool:self.theSwitch.on forKey:self.userDefaultsBoolKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (void)toggleTheSwitch {
    
    NSLog(@"PTSwitchCell | toggleTheSwitch");
    
    if ([self.theSwitch isOn]) {
        [self.theSwitch setOn:NO animated:YES];
        [self switchValueDidChange:self.theSwitch];
    }
    else {
        [self.theSwitch setOn:YES animated:YES];
        [self switchValueDidChange:self.theSwitch];
    }
}

@end
