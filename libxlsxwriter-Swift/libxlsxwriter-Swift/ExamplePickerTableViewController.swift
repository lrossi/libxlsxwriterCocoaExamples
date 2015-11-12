//
//  ExamplePickerTableViewController.swift
//  libxlsxwriter-Swift
//
//  Created by Ludovico Rossi on 12/11/15.
//  Copyright © 2015 Ludovico Rossi. All rights reserved.
//

import UIKit

class ExamplePickerTableViewController: UITableViewController {
    private static let kExampleCellIdentifier = "ExampleCell"
    private static let kViewExampleSegueIdentifier = "ViewExample"
    
    private lazy var swiftExample = SwiftAnatomyExample()
    private lazy var defaultExamples = DefaultExamples.createExamples() as! [Example]
    
    // MARK: - Table View Data Source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // the first section displays the Anatomy Example written in Swift, the second section all the other examples
        return section == 0 ? 1 : defaultExamples.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(ExamplePickerTableViewController.kExampleCellIdentifier)!
        let example = exampleAtIndexPath(indexPath)
        cell.textLabel!.text = example.title
        cell.detailTextLabel!.text = example.subtitle
        
        return cell
    }
    
    // MARK: - View Online
    
    @IBAction func openWebPage() {
        let pageURL = NSURL(string: "http://libxlsxwriter.github.io/examples.html")!
        UIApplication.sharedApplication().openURL(pageURL)
    }
    
    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == ExamplePickerTableViewController.kViewExampleSegueIdentifier {
            let vc = segue.destinationViewController as! ExampleViewerViewController
            vc.example = exampleAtIndexPath(tableView.indexPathForSelectedRow!)
        }
    }
    
    // MARK: Obtain Example
    
    private func exampleAtIndexPath(indexPath: NSIndexPath) -> Example {
        // the first section displays the Anatomy Example written in Swift, the second section all the other examples
        return indexPath.section == 0 ? swiftExample : defaultExamples[indexPath.row]
    }
}
