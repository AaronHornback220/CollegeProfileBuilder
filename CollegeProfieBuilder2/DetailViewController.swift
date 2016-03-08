//
//  DetailViewController.swift
//  CollegeProfieBuilder2
//
//  Created by Student on 3/1/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{
    @IBOutlet weak var collegeTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var populationTextField: UITextField!
    var college : College!
    
    
    @IBAction func onTappedSaveButton(sender: AnyObject) {
        college.name = collegeTextField.text!
        college.state = stateTextField.text!
        college.population = Int(populationTextField.text!)!
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        collegeTextField.text = college.name
        stateTextField.text = college.name
        populationTextField.text = String(college.population)
        imageView.image = college.image
    }
    
}

