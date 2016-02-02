//
//  DefaultExamples.m
//  libxlsxwriter-ObjC
//
//  Created by Ludovico Rossi on 11/11/15.
//  Copyright © 2015 Ludovico Rossi. All rights reserved.
//

#import "DefaultExamples.h"
#import "HelloExample.h"
#import "AnatomyExample.h"
#import "DemoExample.h"
#import "Tutorial1Example.h"
#import "Tutorial2Example.h"
#import "Tutorial3Example.h"
#import "FormatFontExample.h"
#import "FormatNumFormatExample.h"
#import "DatesAndTimes1Example.h"
#import "DatesAndTimes2Example.h"
#import "DatesAndTimes3Example.h"
#import "HyperlinksExample.h"
#import "ArrayFormulaExample.h"
#import "UTF8Example.h"
#import "ConstantMemoryExample.h"
#import "MergeRangeExample.h"
#import "AutofilterExample.h"
#import "HeadersFootersExample.h"
#import "DefinedNameExample.h"
#import "TabColorsExample.h"
#import "HideSheetExample.h"
#import "DocPropertiesExample.h"
#import "WorksheetProtectionExample.h"
#import "HideRowColExample.h"
#import "PanesExample.h"

@implementation DefaultExamples

+ (NSArray<Example *> *)createExamples {
    return @[[HelloExample new],
             [AnatomyExample new],
             [DemoExample new],
             [Tutorial1Example new],
             [Tutorial2Example new],
             [Tutorial3Example new],
             [FormatFontExample new],
             [FormatNumFormatExample new],
             [DatesAndTimes1Example new],
             [DatesAndTimes2Example new],
             [DatesAndTimes3Example new],
             [HyperlinksExample new],
             [ArrayFormulaExample new],
             [UTF8Example new],
             [ConstantMemoryExample new],
             [MergeRangeExample new],
             [AutofilterExample new],
             [HeadersFootersExample new],
             [DefinedNameExample new],
			 [TabColorsExample new],
			 [HideSheetExample new],
			 [DocPropertiesExample new],
			 [WorksheetProtectionExample new],
			 [HideRowColExample new],
			 [PanesExample new]];
}

@end
