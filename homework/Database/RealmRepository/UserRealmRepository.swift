//
//  UserRealmRepository.swift
//  homework
//
//  Created by Даниил Новоселов on 1/30/20.
//  Copyright © 2020 Даниил Новоселов. All rights reserved.
//

import Foundation
import RealmSwift

class UsersRepositoryRealm {
    func addUser(firstName: String, lastName: String, avatarPath: String) {
        let realm = try? Realm()
        let newUser = UserRealm()
        newUser.id = 1
        newUser.firstName = firstName
        newUser.lastName = lastName
        newUser.avatarPath = avatarPath
        
        try? realm?.write {
            realm?.add(newUser)
        }
        
    }
    
    func getUsers() -> Results<UserRealm> {
        let realm = try! Realm()
        return realm.objects(UserRealm.self)
    }
    
    func getUsers(id: Int) -> UserRealm? {
           let realm = try! Realm()
        return realm.objects(UserRealm.self).filter("id == %@", id).first
    }
}


