//
//  GroupRealm.swift
//  homework
//
//  Created by Даниил Новоселов on 1/22/20.
//  Copyright © 2020 Даниил Новоселов. All rights reserved.
//

import Foundation
import RealmSwift


class GroupRealm: Object {
    @objc dynamic var id = 0
    @objc dynamic var username = ""
    @objc dynamic var avatarPath = ""
     
    var groups = List<Group>()
        
    override class func primaryKey() -> String? {
    return "id"
}




