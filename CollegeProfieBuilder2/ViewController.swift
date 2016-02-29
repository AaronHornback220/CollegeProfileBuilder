//
//  ViewController.swift
//  CollegeProfieBuilder2
//
//  Created by Student on 2/3/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var colleges : [College] = []
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colleges.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
        cell.textLabel?.text = colleges[indexPath.row].name
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            colleges.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
    
    @IBAction func onTappedPlusButton(sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Add Colleges", message: nil, preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Add Colleges Here"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel , handler: nil )
        alert.addAction(cancelAction)
        let addAction = UIAlertAction(title: "Add", style: .Default) { (action) -> Void in
            let collegeTextField = alert.textFields![0] as UITextField
            self.colleges.append(College(name: collegeTextField.text!))
            self.tableView.reloadData()
        }
        alert.addAction(addAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexpath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let college = colleges[sourceIndexPath.row]
            colleges.removeAtIndex(sourceIndexPath.row)
            colleges.insert(college, atIndex: destinationIndexPath.row)
    
        }
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBAction func onTappedEditButton(sender: UIBarButtonItem) {
        editButton.tag = 0
        if sender.tag == 0 {
            tableView.editing = true
            sender.tag = 1
            
        }
        else{
            tableView.editing = false
            sender.tag = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      colleges.append(College(name: "Harper College", state: "Illinois", population: 6765, image: UIImage(named: "harper")!))
        
        
    }
    


}

