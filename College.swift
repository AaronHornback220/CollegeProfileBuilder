//
//  College.swift
//  CollegeProfieBuilder2
//
//  Created by Student on 2/26/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class College: NSObject {
    
    var name = ""
    var location = ""
    var enrollment = 0
    var webpage = ""
    var image = UIImage(named: "Default")
   
    
    convenience init(name: String, location: String, enrollment: Int, webpage: String, image: UIImage) {
        self.init()
        self.name = name
        self.location = location
        self.enrollment = enrollment
        self.webpage = webpage
        self.image = image
    }
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
    
    }


