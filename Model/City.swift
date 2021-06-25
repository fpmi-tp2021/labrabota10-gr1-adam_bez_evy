//
//  City.swift
//  MAnDAr_App
//
//  Created by arizngy on 19/06/2021.

import UIKit

class City: NSObject {
    var name: String?
    var imageName: String?
    
     init(name: String?,imageName: String?) {
        super.init()
        self.name = name
        self.imageName = imageName
    }

}
