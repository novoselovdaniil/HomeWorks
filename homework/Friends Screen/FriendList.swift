//
//  FriendList.swift
//  homework
//
//  Created by Даниил Новоселов on 12/1/19.
//  Copyright © 2019 Даниил Новоселов. All rights reserved.
//

import UIKit
import RealmSwift

struct Section<T> {
    var title: String
    var items: [T]
}
protocol FriendsListView {
    func updateTable()
}

class FriendList: UITableViewController {
     
    var presenter: FriendsPresenter?
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
       
        
        presenter = FriendsPresenterImplementation(database: UsersRepositoryRealm)
        presenter?.viewDidLoad()
        
   
    }
  
     
    override func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.numberOfSections() ?? 0
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection(section: section) ?? 0
    }

  
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendTemplate", for: indexPath) as? FriendCell,
            let model = presenter?.getModelAtIndex(indexPath: indexPath) else {
            return UITableViewCell()
        }
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return presenter?.getTitleForSection(section: section)
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return presenter?.getSectionIndexTitles()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*let username = friendList[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "PhotoController") as! PhotoController
        viewController.user = username.lastName
        self.navigationController?.pushViewController(viewController, animated: true)*/
    }
}

extension FriendList: FriendsListView {
    func updateTable() {
        tableView.reloadData()
    }
}

extension FriendList : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.searchFriends(name: searchText)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
        
    
    }
}
