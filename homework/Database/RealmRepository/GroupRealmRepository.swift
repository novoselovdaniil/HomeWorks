//
//  GroupRealmRepository.swift
//  homework
//
//  Created by Даниил Новоселов on 1/30/20.
//  Copyright © 2020 Даниил Новоселов. All rights reserved.
//

import Foundation
import RealmSwift

class GroupsRepositoryRealm {
    
    func addGroup(username: String, avatarPath: String) {
        let realm = try? Realm()
        let newGroup = GroupRealm()
        newGroup.id = 1
        newGroup.username = ""
        newGroup.avatarPath = ""
        
        try? realm?.write {
            realm?.add(newGroup)
        }
    }
    
    func getGroups() -> Results<GroupRealm> {
        let realm = try! Realm()
        return realm.objects(GroupRealm.self)
    }
    func getGroup(id: Int) -> GroupRealm? {
           let realm = try! Realm()
        return realm.objects(GroupRealm.self).filter("id == %@", id).first
    }
}



