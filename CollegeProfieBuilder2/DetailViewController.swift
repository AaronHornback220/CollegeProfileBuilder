//
//  DetailViewController.swift
//  CollegeProfieBuilder2
//
//  Created by Student on 3/1/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController, SFSafariViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    @IBOutlet weak var collegeTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var enrollmentTextField: UITextField!
    @IBOutlet weak var websiteTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    var college : College!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        collegeTextField.text = college.name
        locationTextField.text = college.location
        enrollmentTextField.text = String(college.enrollment)
        websiteTextField.text = college.webpage
        imageView.image = college.image
        imagePicker.delegate = self
    }
    
    @IBAction func onTappedSaveButton(sender: AnyObject) {
        college.name = collegeTextField.text!
        college.location = locationTextField.text!
        college.enrollment = Int(enrollmentTextField.text!)!
        college.webpage = websiteTextField.text!
        college.image = imageView.image
    }
    func safariViewControllerDidFinish(controller: SFSafariViewController) {
        controller.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imagePicker.dismissViewControllerAnimated(true) { () -> Void in
            let selectedImage = info[UIImagePickerControllerOriginalImage] as!
            UIImage
            self.imageView.image = selectedImage
        }
    }
    
    @IBAction func onGoButtonTapped(sender: UIButton) {
        if let url = NSURL(string: websiteTextField.text!) {
            let svc = SFSafariViewController(URL: url)
            svc.delegate = self
            self.presentViewController(svc, animated: true, completion: nil)
        }
    }
    @IBAction func onLibraryButtonTapped(sender: AnyObject) {
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func onCameraButtonTapped(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
}





