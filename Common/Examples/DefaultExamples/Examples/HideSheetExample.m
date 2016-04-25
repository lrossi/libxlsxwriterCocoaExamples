//
//  HideSheetExample.m
//  libxlsxwriter-ObjC
//
//  Created by Ludovico Rossi on 02/02/16.
//  Copyright © 2016 Ludovico Rossi. All rights reserved.
//

#import <libxlsxwriter/xlsxwriter.h>
#import "HideSheetExample.h"

@implementation HideSheetExample

- (NSString *)title {
	return @"Hide Sheet";
}

- (NSString *)subtitle {
	return @"Example of hiding a worksheet";
}

- (NSString *)outputFileName {
	return @"hide_sheet";
}

- (void)run {
	/*
	 * Example of how to hide a worksheet using libxlsxwriter.
	 *
	 * Copyright 2014-2015, John McNamara, jmcnamara@cpan.org
	 *
	 */

	lxw_workbook  *workbook   = workbook_new([self.outputFilePath fileSystemRepresentation]);
	lxw_worksheet *worksheet1 = workbook_add_worksheet(workbook, NULL);
	lxw_worksheet *worksheet2 = workbook_add_worksheet(workbook, NULL);
	lxw_worksheet *worksheet3 = workbook_add_worksheet(workbook, NULL);

	/* Hide Sheet2. It won't be visible until it is unhidden in Excel. */
	worksheet_hide(worksheet2);

	worksheet_write_string(worksheet1, 0, 0, "Sheet2 is hidden", NULL);
	worksheet_write_string(worksheet2, 0, 0, "Now it's my turn to find you!", NULL);
	worksheet_write_string(worksheet3, 0, 0, "Sheet2 is hidden", NULL);

	/* Make the first column wider to make the text clearer. */
	worksheet_set_column(worksheet1, 0, 0, 30, NULL);
	worksheet_set_column(worksheet2, 0, 0, 30, NULL);
	worksheet_set_column(worksheet3, 0, 0, 30, NULL);

	workbook_close(workbook);
}

@end
