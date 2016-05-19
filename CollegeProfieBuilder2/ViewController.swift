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
    @IBOutlet weak var editButton: UIBarButtonItem!
    var colleges : [College] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colleges.append(College(name: "Harper College", location: "Palatine, Illinois", enrollment: 6765, webpage: "http://goforward.harpercollege.edu", image:UIImage(named: "harper")!))
        colleges.append(College(name: "University of Illinois", location: "Champaign, Illinois", enrollment: 44087, webpage: "http://illinois.edu", image: UIImage(named:"IllinoisLogo.png")!))
        colleges.append(College(name: "University of Wisconsin-Madison", location: "Madison, Wisconsin", enrollment: 43193, webpage: "http://www.wisc.edu", image: UIImage(named:"U.png")!))
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
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
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexpath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let college = colleges[sourceIndexPath.row]
        colleges.removeAtIndex(sourceIndexPath.row)
        colleges.insert(college, atIndex: destinationIndexPath.row)
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
    
    @IBAction func onTappedEditButton(sender: UIBarButtonItem) {
        if sender.tag == 0 {
            tableView.editing = true
            sender.tag = 1
        }
        else{
            tableView.editing = false
            sender.tag = 0
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as! DetailViewController
        let index = tableView.indexPathForSelectedRow?.row
        dvc.college = colleges[index!]
    }
}

