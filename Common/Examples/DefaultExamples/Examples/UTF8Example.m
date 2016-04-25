//
//  UTF8Example.m
//  libxlsxwriter-ObjC
//
//  Created by Ludovico Rossi on 11/11/15.
//  Copyright © 2015 Ludovico Rossi. All rights reserved.
//

#import <libxlsxwriter/xlsxwriter.h>
#import "UTF8Example.h"

@implementation UTF8Example

- (NSString *)title {
    return @"UTF-8";
}

- (NSString *)subtitle {
    return @"A example of some UTF-8 text";
}

- (NSString *)outputFileName {
    return @"utf8";
}

- (void)run {
    /*
     * A simple Unicode UTF-8 example using libxlsxwriter.
     *
     * Note: The source file must be UTF-8 encoded.
     *
     * Copyright 2014-2015, John McNamara, jmcnamara@cpan.org
     *
     */
    
    lxw_workbook  *workbook  = new_workbook([self.outputFilePath fileSystemRepresentation]);
    lxw_worksheet *worksheet = workbook_add_worksheet(workbook, NULL);
    
    worksheet_write_string(worksheet, 2, 1, "Это фраза на русском!", NULL);
    
    workbook_close(workbook);
}

@end
