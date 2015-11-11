//
//  DefinedNameExample.m
//  libxlsxwriter-ObjC
//
//  Created by Ludovico Rossi on 11/11/15.
//  Copyright © 2015 Ludovico Rossi. All rights reserved.
//

#import <libxlsxwriter/xlsxwriter.h>
#import "DefinedNameExample.h"

@implementation DefinedNameExample

- (NSString *)title {
    return @"Defined Name";
}

- (NSString *)subtitle {
    return @"Example of how to create defined names";
}

- (void)run {
    /*
     * Example of how to create defined names using libxlsxwriter. This method is
     * used to define a user friendly name to represent a value, a single cell or
     * a range of cells in a workbook.
     *
     * Copyright 2014-2015, John McNamara, jmcnamara@cpan.org
     *
     */
    
    lxw_workbook  *workbook   = new_workbook("defined_name.xlsx");
    lxw_worksheet *worksheet;
    
    /* We don't use the returned worksheets in this example and use a generic
     * loop instead. */
    workbook_add_worksheet(workbook, NULL);
    workbook_add_worksheet(workbook, NULL);
    
    /* Define some global/workbook names. */
    workbook_define_name(workbook, "Sales", "=!G1:H10");
    workbook_define_name(workbook, "Exchange_rate", "=0.96");
    workbook_define_name(workbook, "Sales",         "=Sheet1!$G$1:$H$10");
    
    /* Define a local/worksheet name. */
    workbook_define_name(workbook, "Sheet2!Sales",  "=Sheet2!$G$1:$G$10");
    
    /* Write some text to the worksheets and a defined names in a formula. */
    LXW_FOREACH_WORKSHEET(worksheet, workbook){
        worksheet_set_column(worksheet, 0, 0, 45, NULL, NULL);
        
        worksheet_write_string(worksheet, 0, 0,
                               "This worksheet contains some defined names.", NULL);
        
        worksheet_write_string(worksheet, 1, 0,
                               "See Formulas -> Name Manager above.", NULL);
        
        worksheet_write_string(worksheet, 2, 0,
                               "Example formula in cell B3 ->", NULL);
        
        worksheet_write_formula(worksheet, 2, 1, "=Exchange_rate", NULL);
    }
    
    workbook_close(workbook);
}

@end
