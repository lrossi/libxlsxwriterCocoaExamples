//
//  ExampleViewerViewController.swift
//  libxlsxwriter-Swift
//
//  Created by Ludovico Rossi on 12/11/15.
//  Copyright © 2015 Ludovico Rossi. All rights reserved.
//

import UIKit

class ExampleViewerViewController: UIViewController, UIWebViewDelegate, UIDocumentInteractionControllerDelegate {
    var example: Example!
    
    @IBOutlet private weak var webView: UIWebView!
    @IBOutlet private weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet private weak var actionButton: UIBarButtonItem!
    
    private var documentInteractionController: UIDocumentInteractionController!
    
    // The minimum time the loading spinning wheel is shown for (in order to avoid a quick flashing when the loading time is too short)
    private static let kMinLoadingTime = 0.3
    
    // MARK: - View Lifecycle
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // set title
        navigationItem.title = example.title
        
        // start activity indicator
        view.userInteractionEnabled = false
        actionButton.enabled = false
        activityIndicatorView.startAnimating()
        
        // store current time interval before running the example
        let timeBeforeRun = NSDate.timeIntervalSinceReferenceDate()
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { [weak self] in
            // run example and generate output Excel file
            self?.example.run()
        
            // calculate time elapsed while running the example
            let elapsedTime = NSDate.timeIntervalSinceReferenceDate() - timeBeforeRun
        
            // calculate time we still need to wait (if any) before displaying the output Excel file
            let timeToWaitFor = max(ExampleViewerViewController.kMinLoadingTime - elapsedTime, 0.0)
        
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(timeToWaitFor * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) { [weak self] in
                if let mySelf = self {
                    // display output Excel file in the web view
                    let fileURL = NSURL(fileURLWithPath: mySelf.example.outputFilePath)
                    let request = NSURLRequest(URL: fileURL)
                
                    mySelf.webView.loadRequest(request)
                }
            }
        }
    }

    // MARK: - Web View Delegate
    
    func webViewDidFinishLoad(webView: UIWebView) {
        // stop activity indicator
        activityIndicatorView.stopAnimating()
        view.userInteractionEnabled = true
        actionButton.enabled = true
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if navigationType == .LinkClicked {
            // open each external link in the default app that handles it
            UIApplication.sharedApplication().openURL(request.URL!)
            
            return false
        }
        
        return true
    }
    
    // MARK: - Action Button
    
    @IBAction func didTapActionButton(sender: UIBarButtonItem) {
        // show default options for the output Excel file
        let fileURL = NSURL(fileURLWithPath:example.outputFilePath)
        documentInteractionController = UIDocumentInteractionController(URL: fileURL)
        documentInteractionController.delegate = self
        documentInteractionController.presentOptionsMenuFromBarButtonItem(sender, animated: true)
    }
}
