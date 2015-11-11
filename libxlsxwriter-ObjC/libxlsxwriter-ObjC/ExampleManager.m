//
//  ExampleManager.m
//  libxlsxwriter-ObjC
//
//  Created by Ludovico Rossi on 11/11/15.
//  Copyright © 2015 Ludovico Rossi. All rights reserved.
//

#import "ExampleManager.h"

static NSString * const kTitleKey = @"title";
static NSString * const kDescriptionKey = @"description";


@interface ExampleManager ()

@property (readonly, nonatomic) NSArray *metadata;

@end


@implementation ExampleManager

#pragma mark - Object Lifecycle

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupMetadata];
    }
    
    return self;
}

#pragma mark - Examples Metadata

- (void)setupMetadata {
    _metadata = @[@{kTitleKey: @"Hello",                kDescriptionKey: @"A simple hello world example"},
                  @{kTitleKey: @"Anatomy",              kDescriptionKey: @"The anatomy of a libxlsxwriter program"},
                  @{kTitleKey: @"Demo",                 kDescriptionKey: @"Demo of some of the libxlsxwriter features"},
                  @{kTitleKey: @"Tutorial 1",           kDescriptionKey: @"Tutorial 1 from the documentation"},
                  @{kTitleKey: @"Tutorial 2",           kDescriptionKey: @"Tutorial 2 from the documentation"},
                  @{kTitleKey: @"Tutorial 3",           kDescriptionKey: @"Tutorial 3 from the documentation"},
                  @{kTitleKey: @"Format Font",          kDescriptionKey: @"Example of writing data with font formatting"},
                  @{kTitleKey: @"Format Num Format",    kDescriptionKey: @"Example of writing data with number formatting"},
                  @{kTitleKey: @"Dates and Times 1",    kDescriptionKey: @"Writing dates and times with numbers"},
                  @{kTitleKey: @"Dates and Times 2",    kDescriptionKey: @"Writing dates and times with datetime"},
                  @{kTitleKey: @"Dates and Times 3",    kDescriptionKey: @"Dates and times with different formats"},
                  @{kTitleKey: @"Hyperlinks",           kDescriptionKey: @"A example of writing urls/hyperlinks"},
                  @{kTitleKey: @"Array Formula",        kDescriptionKey: @"A example of using array formulas"},
                  @{kTitleKey: @"UTF-8",                kDescriptionKey: @"A example of some UTF-8 text"},
                  @{kTitleKey: @"Constant Memory",      kDescriptionKey: @"Write a large file with constant memory usage"},
                  @{kTitleKey: @"Merge Range",          kDescriptionKey: @"Create a merged range of cells"},
                  @{kTitleKey: @"Autofilter",           kDescriptionKey: @"An example of a worksheet autofilter"},
                  @{kTitleKey: @"Headers/Footers",      kDescriptionKey: @"Example of adding worksheet headers/footers"},
                  @{kTitleKey: @"Defined Name",         kDescriptionKey: @"Example of how to create defined names"}];
}

- (NSUInteger)numberOfExamples {
    return self.metadata.count;
}

- (NSString *)titleOfExampleAtIndex:(NSUInteger)index {
    return self.metadata[index][kTitleKey];
}

- (NSString *)descriptionOfExampleAtIndex:(NSUInteger)index {
    return self.metadata[index][kDescriptionKey];
}

#pragma mark - Run Examples

@end
