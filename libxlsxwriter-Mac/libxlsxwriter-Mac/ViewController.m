//
//  ViewController.m
//  libxlsxwriter-Mac
//
//  Created by Ludovico Rossi on 12/11/15.
//  Copyright © 2015 Ludovico Rossi. All rights reserved.
//

#import "ViewController.h"
#import "DefaultExamples.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet NSPopUpButton *popUpButton;
@property (weak, nonatomic) IBOutlet NSTextField *pathLabel;

@property (readonly, nonatomic) NSArray *examples;

@end


@implementation ViewController
@synthesize examples=_examples;

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pathLabel.stringValue = @"";
    
    for (Example *example in self.examples) {
        [self.popUpButton addItemWithTitle:example.title];
    }
}

#pragma mark - Export

- (IBAction)export:(id)sender {
    Example *example = self.examples[self.popUpButton.indexOfSelectedItem];
    [example run];
    
    self.pathLabel.stringValue = example.outputFilePath;
}

#pragma mark - Examples

- (NSArray *)examples {
    if (!_examples) {
        _examples = [DefaultExamples createExamples];
    }
    
    return _examples;
}

@end
