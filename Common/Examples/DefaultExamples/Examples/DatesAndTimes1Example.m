//
//  DatesAndTimes1Example.m
//  libxlsxwriter-ObjC
//
//  Created by Ludovico Rossi on 11/11/15.
//  Copyright © 2015 Ludovico Rossi. All rights reserved.
//

#import <libxlsxwriter/xlsxwriter.h>
#import "DatesAndTimes1Example.h"

@implementation DatesAndTimes1Example

- (NSString *)title {
    return @"Dates and Times 1";
}

- (NSString *)subtitle {
    return @"Writing dates and times with numbers";
}

- (NSString *)outputFileName {
    return @"date_and_times01";
}

- (void)run {
    /*
     * Example of writing a dates and time in Excel using a number with date
     * formatting. This demonstrates that dates and times in Excel are just
     * formatted real numbers.
     *
     * An easier approach using a lxw_datetime struct is shown in example
     * dates_and_times02.c.
     *
     * Copyright 2014-2015, John McNamara, jmcnamara@cpan.org
     *
     */
    
    /* A number to display as a date. */
    double number = 41333.5;
    
    /* Create a new workbook and add a worksheet. */
    lxw_workbook  *workbook  = new_workbook([self.outputFilePath fileSystemRepresentation]);
    lxw_worksheet *worksheet = workbook_add_worksheet(workbook, NULL);
    
    /* Add a format with date formatting. */
    lxw_format    *format    = workbook_add_format(workbook);
    format_set_num_format(format, "mmm d yyyy hh:mm AM/PM");
    
    /* Widen the first column to make the text clearer. */
    worksheet_set_column(worksheet, 0, 0, 20, NULL);
    
    /* Write the number without formatting. */
    worksheet_write_number(worksheet, 0, 0, number, NULL   );  // 41333.5
    
    /* Write the number with formatting. Note: the worksheet_write_datetime()
     * function is preferable for writing dates and times. This is for
     * demonstration purposes only.
     */
    worksheet_write_number(worksheet, 1, 0, number, format);   // Feb 28 2013 12:00 PM
    
    workbook_close(workbook);
}

@end
