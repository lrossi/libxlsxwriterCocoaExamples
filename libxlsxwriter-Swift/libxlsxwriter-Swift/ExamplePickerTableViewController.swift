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
    
    private lazy var examples = DefaultExamples.createExamples() as! [Example]
    
    // MARK: - Table View Data Source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return examples.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(ExamplePickerTableViewController.kExampleCellIdentifier)!
        let example = examples[indexPath.row]
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
            vc.example = examples[tableView.indexPathForSelectedRow!.row]
        }
    }
}
