//
//  HideRowColExample.m
//  libxlsxwriter-ObjC
//
//  Created by Ludovico Rossi on 02/02/16.
//  Copyright © 2016 Ludovico Rossi. All rights reserved.
//

#import <libxlsxwriter/xlsxwriter.h>
#import "HideRowColExample.h"

@implementation HideRowColExample

- (NSString *)title {
	return @"Hide Row/Col";
}

- (NSString *)subtitle {
	return @"Example of hiding worksheet rows and columns";
}

- (NSString *)outputFileName {
	return @"hide_row_col";
}

- (void)run {
	/*
	 * An example of how to hide rows and columns using the libxlsxwriter
	 * library.
	 *
	 * In order to hide rows without setting each one, (of approximately 1 million
	 * rows), Excel uses an optimisation to hide all rows that don't have data.
	 *
	 * Copyright 2014-2015, John McNamara, jmcnamara@cpan.org
	 *
	 */

	/* Create a new workbook and add a worksheet. */
	lxw_workbook  *workbook  = workbook_new([self.outputFilePath fileSystemRepresentation]);
	lxw_worksheet *worksheet = workbook_add_worksheet(workbook, NULL);
	lxw_row_t row;

	/* Write some data. */
	worksheet_write_string(worksheet, 0, 3, "Some hidden columns.", NULL);
	worksheet_write_string(worksheet, 7, 0, "Some hidden rows.",    NULL);

	/* Hide all rows without data. */
	worksheet_set_default_row(worksheet, 15, LXW_TRUE);

	/* Set the height of empty rows that we do want to display even if it is */
	/* the default height. */
	for (row = 1; row <= 6; row++)
		worksheet_set_row(worksheet, row, 15, NULL);

	/* Columns can be hidden explicitly. This doesn't increase the file size. */
	lxw_row_col_options options = {.hidden = 1};
	worksheet_set_column_opt(worksheet, COLS("G:XFD"), 8.43, NULL, &options);

	workbook_close(workbook);
}

@end
