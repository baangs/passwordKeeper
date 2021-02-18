//
//  Entry.swift
//  passwordKeeper
//
//  Created by RD on 2/17/21.
//

import UIKit

class Credential {
    var email: String
    var password: String
    let dataCreated: Date
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
        self.dataCreated = Date()
    }
//    
//    convenience init(email: String, password: String) {
//        self.init(email: email, password: password)
//    }
    
}
