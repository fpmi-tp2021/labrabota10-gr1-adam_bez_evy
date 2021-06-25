//
//  User.swift
//  MAnDAr_App
//
//  Created by arizngy on 19/06/2021.

import UIKit

class User: NSObject {
    
    var full_name: String?
    var email: String?
    var phone_number: String?
    var password: String?
    
    init(full_name: String?,email: String?,phone_number: String?,password: String?) {
        super.init()
        self.full_name = full_name
        self.email = email
        self.phone_number = phone_number
        self.password = password
    }

}
