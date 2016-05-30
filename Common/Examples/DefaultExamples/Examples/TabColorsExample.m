//
//  TabColorsExample.m
//  libxlsxwriter-ObjC
//
//  Created by Ludovico Rossi on 02/02/16.
//  Copyright © 2016 Ludovico Rossi. All rights reserved.
//

#import <libxlsxwriter/xlsxwriter.h>
#import "TabColorsExample.h"

@implementation TabColorsExample

- (NSString *)title {
	return @"Tab Colors";
}

- (NSString *)subtitle {
	return @"Example of how to set worksheet tab colors";
}

- (NSString *)outputFileName {
	return @"tab_colors";
}

- (void)run {
	/*
	 * Example of how to set Excel worksheet tab colors using libxlsxwriter.
	 *
	 * Copyright 2014-2015, John McNamara, jmcnamara@cpan.org
	 *
	 */

	lxw_workbook  *workbook   = workbook_new([self.outputFilePath fileSystemRepresentation]);

	/* Set up some worksheets. */
	lxw_worksheet *worksheet1 = workbook_add_worksheet(workbook, NULL);
	lxw_worksheet *worksheet2 = workbook_add_worksheet(workbook, NULL);
	lxw_worksheet *worksheet3 = workbook_add_worksheet(workbook, NULL);
	lxw_worksheet *worksheet4 = workbook_add_worksheet(workbook, NULL);

	/* Set the tab colors. */
	worksheet_set_tab_color(worksheet1, LXW_COLOR_RED);
	worksheet_set_tab_color(worksheet2, LXW_COLOR_GREEN);
	worksheet_set_tab_color(worksheet3, 0xFF9900); /* Orange. */

	/* worksheet4 will have the default color. */
	worksheet_write_string(worksheet4, 0, 0, "Hello", NULL);

	workbook_close(workbook);
}

@end
