//
//  ExamplePickerTableViewController.m
//  libxlsxwriter-ObjC
//
//  Created by Ludovico Rossi on 11/11/15.
//  Copyright © 2015 Ludovico Rossi. All rights reserved.
//

#import "ExamplePickerTableViewController.h"
#import "DefaultExamples.h"

static NSString * const kExampleCellIdentifier = @"ExampleCell";


@interface ExamplePickerTableViewController ()

@property (readonly, nonatomic) NSArray *examples;

@end


@implementation ExamplePickerTableViewController
@synthesize examples=_examples;

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.examples.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kExampleCellIdentifier];
    Example *example = self.examples[indexPath.row];
    cell.textLabel.text = example.title;
    cell.detailTextLabel.text = example.subtitle;

    return cell;
}

#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Example *example = self.examples[indexPath.row];
    [example run];
}

#pragma mark - View Online

- (IBAction)openWebpage {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://libxlsxwriter.github.io/examples.html"]];
}

#pragma mark - Example Manager

- (NSArray *)examples {
    if (!_examples) {
        _examples = [DefaultExamples createExamples];
    }
    
    return _examples;
}

@end
