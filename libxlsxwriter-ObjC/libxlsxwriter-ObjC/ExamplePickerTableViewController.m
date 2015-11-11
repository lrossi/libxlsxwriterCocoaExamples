//
//  ExamplePickerTableViewController.m
//  libxlsxwriter-ObjC
//
//  Created by Ludovico Rossi on 11/11/15.
//  Copyright © 2015 Ludovico Rossi. All rights reserved.
//

#import "ExamplePickerTableViewController.h"
#import "ExampleManager.h"

static NSString * const kExampleCellIdentifier = @"ExampleCell";


@interface ExamplePickerTableViewController ()

@property (readonly, nonatomic) ExampleManager *exampleManager;

@end


@implementation ExamplePickerTableViewController
@synthesize exampleManager=_exampleManager;

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.exampleManager.numberOfExamples;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kExampleCellIdentifier];
    cell.textLabel.text = [self.exampleManager titleOfExampleAtIndex:indexPath.row];
    cell.detailTextLabel.text = [self.exampleManager descriptionOfExampleAtIndex:indexPath.row];

    return cell;
}

#pragma mark - Example Manager

- (ExampleManager *)exampleManager {
    if (!_exampleManager) {
        _exampleManager = [[ExampleManager alloc] init];
    }
    
    return _exampleManager;
}

@end
