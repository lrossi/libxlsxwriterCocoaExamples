//
//  ExampleViewerViewController.m
//  libxlsxwriter-ObjC
//
//  Created by Ludovico Rossi on 11/11/15.
//  Copyright © 2015 Ludovico Rossi. All rights reserved.
//

#import "ExampleViewerViewController.h"
#import "Example.h"

@interface ExampleViewerViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end


@implementation ExampleViewerViewController

#pragma mark - View Lifecycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationItem.title = self.example.title;
    
    __weak typeof(self) weakSelf = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [weakSelf.example run];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (weakSelf) {
                NSURL *fileURL = [NSURL fileURLWithPath:weakSelf.example.outputFilePath];
                NSURLRequest *request = [NSURLRequest requestWithURL:fileURL];
                
                [weakSelf.webView loadRequest:request];
            }
        });
    });
}

#pragma mark - Action Button

- (IBAction)didTapActionButton:(UIBarButtonItem *)sender {
    NSURL *fileURL = [NSURL fileURLWithPath:self.example.outputFilePath];
    UIDocumentInteractionController *controller = [UIDocumentInteractionController interactionControllerWithURL:fileURL];
    [controller presentOptionsMenuFromBarButtonItem:sender animated:YES];
}

@end
