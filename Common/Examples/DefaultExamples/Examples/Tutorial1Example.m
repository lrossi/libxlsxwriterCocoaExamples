//
//  Tutorial1Example.m
//  libxlsxwriter-ObjC
//
//  Created by Ludovico Rossi on 11/11/15.
//  Copyright © 2015 Ludovico Rossi. All rights reserved.
//

#import <libxlsxwriter/xlsxwriter.h>
#import "Tutorial1Example.h"

@implementation Tutorial1Example

- (NSString *)title {
    return @"Tutorial 1";
}

- (NSString *)subtitle {
    return @"Tutorial 1 from the documentation";
}

- (NSString *)outputFileName {
    return @"tutorial01";
}

- (void)run {
    /*
     * A simple program to write some data to an Excel file using the
     * libxlsxwriter library.
     *
     * This program is shown, with explanations, in Tutorial 1 of the
     * libxlsxwriter documentation.
     *
     * Copyright 2014-2015, John McNamara, jmcnamara@cpan.org
     *
     */
    
    /* Some data we want to write to the worksheet. */
    struct expense {
        char item[32];
        int  cost;
    };
    struct expense expenses[] = {
        {"Rent", 1000},
        {"Gas",   100},
        {"Food",  300},
        {"Gym",    50},
    };
    
    /* Create a workbook and add a worksheet. */
    lxw_workbook  *workbook  = new_workbook([self.outputFilePath fileSystemRepresentation]);
    lxw_worksheet *worksheet = workbook_add_worksheet(workbook, NULL);
    
    /* Start from the first cell. Rows and columns are zero indexed. */
    int row = 0;
    int col = 0;
    
    /* Iterate over the data and write it out element by element. */
    for (row = 0; row < 4; row++) {
        worksheet_write_string(worksheet, row, col,     expenses[row].item, NULL);
        worksheet_write_number(worksheet, row, col + 1, expenses[row].cost, NULL);
    }
    
    /* Write a total using a formula. */
    worksheet_write_string (worksheet, row, col,     "Total",       NULL);
    worksheet_write_formula(worksheet, row, col + 1, "=SUM(B1:B4)", NULL);
    
    /* Save the workbook and free any allocated memory. */
    workbook_close(workbook);
}

@end
