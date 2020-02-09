//
//  PhotoRealmRepository.swift
//  homework
//
//  Created by Даниил Новоселов on 1/30/20.
//  Copyright © 2020 Даниил Новоселов. All rights reserved.
//

import Foundation
import RealmSwift

class PhotosRepositoryRealm {
    

    
    func addPhoto(imageName: String) {
        let realm = try? Realm()
        let newPhoto = PhotoRealm()
        newPhoto.id = 1
        newPhoto.imageName = ""
     
        
        try? realm?.write {
            realm?.add(newPhoto)
        }
    }
    
    func getAllPhotos() -> Results<PhotoRealm> {
        let realm = try! Realm()
        return realm.objects(PhotoRealm.self)
    }
    func getPhoto(id: Int) -> PhotoRealm? {
           let realm = try! Realm()
        return realm.objects(PhotoRealm.self).filter("id == %@", id).first
       }
}


