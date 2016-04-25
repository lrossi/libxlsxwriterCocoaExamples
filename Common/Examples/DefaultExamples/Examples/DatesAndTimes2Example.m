//
//  DatesAndTimes2Example.m
//  libxlsxwriter-ObjC
//
//  Created by Ludovico Rossi on 11/11/15.
//  Copyright © 2015 Ludovico Rossi. All rights reserved.
//

#import <libxlsxwriter/xlsxwriter.h>
#import "DatesAndTimes2Example.h"

@implementation DatesAndTimes2Example

- (NSString *)title {
    return @"Dates and Times 2";
}

- (NSString *)subtitle {
    return @"Writing dates and times with datetime";
}

- (NSString *)outputFileName {
    return @"date_and_times02";
}

- (void)run {
    /*
     * Example of writing dates and times in Excel using an lxw_datetime struct
     * and date formatting.
     *
     * Copyright 2014-2015, John McNamara, jmcnamara@cpan.org
     *
     */
    
    /* A datetime to display. */
    lxw_datetime datetime = {2013, 2, 28, 12, 0, 0.0};
    
    /* Create a new workbook and add a worksheet. */
    lxw_workbook  *workbook  = new_workbook([self.outputFilePath fileSystemRepresentation]);
    lxw_worksheet *worksheet = workbook_add_worksheet(workbook, NULL);
    
    /* Add a format with date formatting. */
    lxw_format    *format    = workbook_add_format(workbook);
    format_set_num_format(format, "mmm d yyyy hh:mm AM/PM");
    
    /* Widen the first column to make the text clearer. */
    worksheet_set_column(worksheet, 0, 0, 20, NULL);
    
    /* Write the datetime without formatting. */
    worksheet_write_datetime(worksheet, 0, 0, &datetime, NULL  );  // 41333.5
    
    /* Write the datetime with formatting. */
    worksheet_write_datetime(worksheet, 1, 0, &datetime, format);  // Feb 28 2013 12:00 PM
    
    workbook_close(workbook);
}

@end
