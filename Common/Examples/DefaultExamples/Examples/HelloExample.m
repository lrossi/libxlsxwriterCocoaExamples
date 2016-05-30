//
//  HelloExample.m
//  libxlsxwriter-ObjC
//
//  Created by Ludovico Rossi on 11/11/15.
//  Copyright © 2015 Ludovico Rossi. All rights reserved.
//

#import <libxlsxwriter/xlsxwriter.h>
#import "HelloExample.h"

@implementation HelloExample

- (NSString *)title {
    return @"Hello";
}

- (NSString *)subtitle {
    return @"A simple hello world example";
}

- (NSString *)outputFileName {
    return @"hello_world";
}

- (void)run {
    /*
     * Example of writing some data to a simple Excel file using libxlsxwriter.
     *
     * Copyright 2014-2015, John McNamara, jmcnamara@cpan.org
     *
     */
    
    lxw_workbook  *workbook  = new_workbook([self.outputFilePath fileSystemRepresentation]);
    lxw_worksheet *worksheet = workbook_add_worksheet(workbook, NULL);
    
    worksheet_write_string(worksheet, 0, 0, "Hello", NULL);
    worksheet_write_number(worksheet, 1, 0, 123, NULL);
    
    workbook_close(workbook);
}

@end
