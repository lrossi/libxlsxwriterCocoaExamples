//
//  ExampleViewerViewController.m
//  libxlsxwriter-ObjC
//
//  Created by Ludovico Rossi on 11/11/15.
//  Copyright © 2015 Ludovico Rossi. All rights reserved.
//

#import "ExampleViewerViewController.h"
#import "Example.h"

// The minimum time the loading spinning wheel is shown for (in order to avoid a quick flashing when the loading time is too short)
static NSTimeInterval const kMinLoadingTime = 0.3;


@interface ExampleViewerViewController () <UIWebViewDelegate, UIDocumentInteractionControllerDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;

@property (strong, nonatomic) UIDocumentInteractionController *documentInteractionController;

@end


@implementation ExampleViewerViewController

#pragma mark - View Lifecycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // set title
    self.navigationItem.title = self.example.title;
    
    // start activity indicator
    self.view.userInteractionEnabled = NO;
    [self.activityIndicatorView startAnimating];
    
    // store current time interval before running the example
    NSTimeInterval beforeRun = [NSDate timeIntervalSinceReferenceDate];
    
    __weak typeof(self) weakSelf = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // run example and generate output Excel file
        [weakSelf.example run];
        
        // calculate time elapsed while running the example
        NSTimeInterval elapsedTime = [NSDate timeIntervalSinceReferenceDate] - beforeRun;
        
        // calculate time we still need to wait (if any) before displaying the output Excel file
        NSTimeInterval timeToWaitFor = MAX(kMinLoadingTime - elapsedTime, 0.0);
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeToWaitFor * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (weakSelf) {
                // display output Excel file in the web view
                NSURL *fileURL = [NSURL fileURLWithPath:weakSelf.example.outputFilePath];
                NSURLRequest *request = [NSURLRequest requestWithURL:fileURL];
                
                [weakSelf.webView loadRequest:request];
            }
        });
    });
}

#pragma mark - Web View Delegate

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    // stop activity indicator
    [self.activityIndicatorView stopAnimating];
    self.view.userInteractionEnabled = YES;
}

- (BOOL)webView:(UIWebView *)inWeb shouldStartLoadWithRequest:(NSURLRequest *)inRequest navigationType:(UIWebViewNavigationType)inType {
    if (inType == UIWebViewNavigationTypeLinkClicked) {
        // open each external link in the default app that handles it
        [[UIApplication sharedApplication] openURL:[inRequest URL]];
        
        return NO;
    }
    
    return YES;
}

#pragma mark - Action Button

- (IBAction)didTapActionButton:(UIBarButtonItem *)sender {
    // show default options for the output Excel file
    NSURL *fileURL = [NSURL fileURLWithPath:self.example.outputFilePath];
    self.documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:fileURL];
    self.documentInteractionController.delegate = self;
    [self.documentInteractionController presentOptionsMenuFromBarButtonItem:sender animated:YES];
}

#pragma mark - Document Interaction Controller Delegate

- (void)documentInteractionControllerDidDismissOptionsMenu:(UIDocumentInteractionController *)controller {
    if (self.documentInteractionController == controller) {
        self.documentInteractionController = nil;
    }
}

@end
