//
//  Example.m
//  libxlsxwriter-ObjC
//
//  Created by Ludovico Rossi on 11/11/15.
//  Copyright © 2015 Ludovico Rossi. All rights reserved.
//

#import "Example.h"

static NSString * const kFileExtension = @"xlsx";


@implementation Example

- (NSString *)outputFilePath {
    NSAssert(self.outputFileName, @"outputFileName needs to be overridden in subclasses");
    
    NSString *documentsFolderPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath = [[documentsFolderPath stringByAppendingPathComponent:self.outputFileName] stringByAppendingPathExtension:kFileExtension];
    
    return filePath;
}

- (void)run {
    NSAssert(NO, @"Needs to be overridden in subclasses");
}

@end
