//
//  PTSwitchCell.h
//  PTSwitchCell
//
//  Created by Phillip Harris on 4/28/14.
//  Copyright (c) 2014 Phillip Harris. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PTSwitchCellDelegate;

extern NSString * const PTSwitchCellReuseIdentifier;

@interface PTSwitchCell : UITableViewCell

@property (nonatomic, weak) id <PTSwitchCellDelegate> delegate;

@property (strong, nonatomic) IBOutlet UISwitch *theSwitch;

/// Optional. Use this if you want the cell to bind the on/off state of the switch to a key in NSUserDefaults.
@property (nonatomic, strong) NSString *userDefaultsBoolKey;

- (IBAction)switchValueDidChange:(id)sender;

- (void)toggleTheSwitch;

@end


@protocol PTSwitchCellDelegate <NSObject>

@optional

- (void)switchCellValueDidChange:(PTSwitchCell *)cell;

@end
