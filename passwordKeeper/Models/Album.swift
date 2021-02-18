//
//  Album.swift
//  passwordKeeper
//
//  Created by RD on 2/17/21.
//

import UIKit

class Albums {
    var image: UIImage
    var title: String
    var password: String
    var verify: String
    
    init(image: UIImage, title:String, password: String, verify: String) {
        self.image = image
        self.title = title
        self.password = password
        self.verify = verify
    }
}


