//
//  Example.h
//  libxlsxwriter-ObjC
//
//  Created by Ludovico Rossi on 11/11/15.
//  Copyright © 2015 Ludovico Rossi. All rights reserved.
//

@import Foundation;


@interface Example : NSObject

@property (readonly, nonatomic, nonnull) NSString *title;
@property (readonly, nonatomic, nonnull) NSString *subtitle;
@property (readonly, nonatomic, nonnull) NSString *outputFileName;
@property (readonly, nonatomic, nonnull) NSString *outputFilePath;

- (void)run;

@end
