//
//  ViewController.m
//  ConstraintShenanigans
//
//  Created by aerych on 8/9/15.
//  Copyright (c) 2015 aerych. All rights reserved.
//

#import "ViewController.h"
#import "ConstraintShenanigans-Swift.h"

static NSString *const ReuseIdentifier = @"ReuseIdentifier";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // CustomTableViewCell uses size classes, TableViewCell does not.
    // Uncomment the one you want to use.
    NSString *nibName;
    nibName = @"CustomTableViewCell";
//    nibName = @"TableViewCell";
    UINib *nib = [UINib nibWithNibName:nibName bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier:ReuseIdentifier];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"default cell appearance";
    }
    return @"cell hiding top view";
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 202.0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomTableViewCell *cell = (CustomTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:ReuseIdentifier];
    // The first cell is normall.
    // The second cell hides the top view and removes the spacing between the top and bottom views.
    // This works as intended when using the TableViewCell
    if (indexPath.section == 1) {
        [cell hideView];
    }
    return cell;
}

@end
