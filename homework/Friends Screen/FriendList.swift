//
//  FriendList.swift
//  homework
//
//  Created by Даниил Новоселов on 12/1/19.
//  Copyright © 2019 Даниил Новоселов. All rights reserved.
//

import UIKit

struct Section<T> {
    var title: String
    var items: [T]
}

class FriendList: UITableViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    var friendList = [User(firstName: "Daria", lastName: "Novoselova",  avatarPath: "person-female"),
                      User( firstName: "Zoye", lastName:"Novoselova",  avatarPath: "person-female"),
                      User(firstName: "Kobe", lastName:"Brayant",  avatarPath: "person-male"),
                      User(firstName: "Lebron", lastName:"James",  avatarPath: "person-male"),
                      User(firstName: "Andrey", lastName:"Markov",  avatarPath: "person-male")]

   var friendsSection = [Section<User>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        
        
        let friendsDictionary = Dictionary.init(grouping: friendList){
            $0.lastName.prefix(1)
           
        }
        friendsSection = friendsDictionary.map {Section(title: String($0.key), items: $0.value) }
        friendsSection.sort {$0.title < $1.title}
        
   
    }
    /*func testAnimation() {
        UIView.animate(withDuration: 2.0,
                       delay: 2.0,
                       options: [.repeat, .autoreverse],
                       animations: {
                        self..transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        })
        
    }*/
    
    
     
    override func numberOfSections(in tableView: UITableView) -> Int {
        return friendsSection.count
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsSection[section].items.count
    }

  
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendTemplate", for: indexPath) as? FriendCell else {
            return UITableViewCell()
        }
        
        let firstname = friendsSection[indexPath.section].items[indexPath.row].firstName
        let lastname = friendsSection[indexPath.section].items[indexPath.row].lastName
        cell.username.text = firstname + " " + lastname
        cell.avatar.image = UIImage(named: friendsSection[indexPath.section].items[indexPath.row].avatarPath)
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return friendsSection[section].title
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return friendsSection.map {$0.title}
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let username = friendList[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "PhotoController") as! PhotoController
        viewController.user = username.lastName
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}


extension FriendList : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let friendsDicrionary = Dictionary.init(grouping: friendList.filter{ (user) -> Bool in
            return searchText.isEmpty ? true : user.firstName.lowercased().contains(searchText.lowercased()) })
        { $0.lastName.prefix(1) }
        friendsSection = friendsDicrionary.map { Section(title: String($0.key), items: $0.value) }
        friendsSection.sort { $0.title < $1.title  }
        tableView.reloadData()
        print(searchText)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
        
    
    }
}
