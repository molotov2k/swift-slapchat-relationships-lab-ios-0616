//
//  RecipientTableViewController.swift
//  SlapChat
//
//  Created by Max Tkach on 7/21/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class RecipientTableViewController: UITableViewController {
    
    let store = DataStore.sharedDataStore
    //var recipients: [Recipient] = []
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        store.fetchData()
        self.tableView.reloadData()
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.recipients.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("recipientCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = store.recipients[indexPath.row].name
        
        return cell
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationVC = segue.destinationViewController as! TableViewController
        let recipientsArray = Array(store.recipients)
        let selectedRowPath = self.tableView.indexPathForSelectedRow
        if let selectedRowPath = selectedRowPath {
            let recipient = recipientsArray[selectedRowPath.row]
            destinationVC.recipient = recipient
        }
    }
    
    
}