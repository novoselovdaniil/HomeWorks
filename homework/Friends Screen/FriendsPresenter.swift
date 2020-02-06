//
//  FriendsPresenter.swift
//  homework
//
//  Created by Даниил Новоселов on 2/4/20.
//  Copyright © 2020 Даниил Новоселов. All rights reserved.
//

import UIKit
import RealmSwift

protocol FriendsPresenter {
    func viewDidLoad()
    func searchFriends(name: String)
    
    func numberOfSections() -> Int
    func numberOfRowsInSection(section: Int) -> Int
    func getSectionIndexTitles() -> [String]?
    func getTitleForSection(section: Int) -> String?
    func getModelAtIndex(indexPath: IndexPath) -> UserRealm?
    
    
}

struct SectionRealm<T: RealmCollectionValue> {
    var title: String
    var items: Results<T>
}

class FriendsPresenterImplementation : FriendsPresenter {
    
 
    private var vkAPI: VKApi
    private var database : FriendsSource
    
    private var sortedFriendsResults = [Section<UserRealm>]()
    private var friendsResult: Results<UserRealm>!
    
    init(database: FriendsSource) {
        vkAPI = VKApi()
        self.database = database
    }
    
    
    func viewDidLoad() {
        
    }
    func searchFriends(name: String) {
        
    }
    
    private func getFriendsFromDatabase() {
        do {
            self.friendsResult = try database.getAllUsers()
        } catch { print(error) }
    }
    private func getFriendsFromApi() {
        vkAPI.getFriendList(token: Session.shared.token) { result in
            switch result {
            case .success(let users):
                do {
                    self.database.addUsers(users: users)
                    self.getFriendsFromDatabase()
                } catch {
                    print(error)
                }
            case .failure(let error):
                print("We got error: \(error)")
            }
        }
    }
    
    private func makeSortedSections() {
     let friendsDictionary = Dictionary.init(grouping: friendsResult){
         $0.lastName.prefix(1)}
     sortedFriendsResults = friendsDictionary.map {Section(title: String($0.key), items: $0.value) }
     sortedFriendsResults.sort {$0.title < $1.title}
    }
}

extension FriendsPresenterImplementation {
   
    
    func numberOfSections() -> Int {
        return sortedFriendsResults.count
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return sortedFriendsResults[section].items.count
    }
    
    func getSectionIndexTitles() -> [String]? {
        return sortedFriendsResults.map {$0.title}
    }
    
    func getTitleForSection(section: Int) -> String? {
        return sortedFriendsResults[section].title
    }
    
    func getModelAtIndex(indexPath: IndexPath) -> UserRealm? {
        return sortedFriendsResults[indexPath.section].items[indexPath.row]
    }
    
}
