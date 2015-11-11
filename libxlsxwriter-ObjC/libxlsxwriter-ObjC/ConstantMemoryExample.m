//
//  ConstantMemoryExample.m
//  libxlsxwriter-ObjC
//
//  Created by Ludovico Rossi on 11/11/15.
//  Copyright © 2015 Ludovico Rossi. All rights reserved.
//

#import <libxlsxwriter/xlsxwriter.h>
#import "ConstantMemoryExample.h"

@implementation ConstantMemoryExample

- (NSString *)title {
    return @"Constant Memory";
}

- (NSString *)subtitle {
    return @"Write a large file with constant memory usage";
}

- (NSString *)outputFileName {
    return @"constant_memory";
}

- (void)run {
    lxw_row_t row;
    lxw_col_t col;
    lxw_row_t max_row = 1000;
    lxw_col_t max_col = 50;
    
    /* Set the worksheet options. */
    lxw_workbook_options options;
    options.constant_memory = 1;
    
    /* Create a new workbook with options. */
    lxw_workbook  *workbook  = new_workbook_opt([self.outputFilePath cStringUsingEncoding:NSUTF8StringEncoding], &options);
    lxw_worksheet *worksheet = workbook_add_worksheet(workbook, NULL);
    
    for (row = 0; row < max_row; row++) {
        for (col = 0; col < max_col; col++) {
            worksheet_write_number(worksheet, row, col, 123.45, NULL);
        }
    }
    
    workbook_close(workbook);
}

@end
