//
//  ExampleManager.h
//  libxlsxwriter-ObjC
//
//  Created by Ludovico Rossi on 11/11/15.
//  Copyright © 2015 Ludovico Rossi. All rights reserved.
//

@import Foundation;


/**
 *  Manager that executes the examples described at http://libxlsxwriter.github.io/examples.html
 */
@interface ExampleManager : NSObject

/**
 *  The number of examples available.
 */
@property (readonly, nonatomic) NSUInteger numberOfExamples;

/**
 *  Returns a human-readable title for the given example.
 *
 *  @param index The index of the example (between 0 and numberOfExamples-1).
 *
 *  @return A human-readable title for the example.
 */
- (NSString *)titleOfExampleAtIndex:(NSUInteger)index;

/**
 *  Returns a human-readable description for the given example.
 *
 *  @param index The index of the example (between 0 and numberOfExamples-1).
 *
 *  @return A human-readable description for the example.
 */
- (NSString *)descriptionOfExampleAtIndex:(NSUInteger)index;

/**
 *  Runs a particular example by generating an Excel file in the temporary folder.
 *
 *  @param index The index of the example to run (between 0 and numberOfExamples-1).
 *
 *  @return The absolute path of the generated Excel file in the temporary folder.
 */
- (NSString *)runExampleAtIndex:(NSUInteger)index;

@end
