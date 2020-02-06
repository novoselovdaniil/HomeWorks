//
//  PhotoRealm.swift
//  homework
//
//  Created by Даниил Новоселов on 1/22/20.
//  Copyright © 2020 Даниил Новоселов. All rights reserved.
//

import Foundation
import RealmSwift

class PhotoRealm: Object {
    @objc dynamic var id = 0
    @objc dynamic var imageName = ""
  
    
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    
}


