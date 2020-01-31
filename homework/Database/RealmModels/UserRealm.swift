//
//  UserRealm.swift
//  homework
//
//  Created by Даниил Новоселов on 1/22/20.
//  Copyright © 2020 Даниил Новоселов. All rights reserved.
//

import Foundation
import RealmSwift


class UserRealm: Object {
    @objc dynamic var id = 0
    @objc dynamic var firstName = ""
    @objc dynamic var lastName = ""
    @objc dynamic var avatarPath = ""
    
    var users = List<User>()
    
    override class func primaryKey() -> String? {
    return "id"
    
}

