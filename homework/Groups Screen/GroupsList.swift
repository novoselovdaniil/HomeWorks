//
//  GroupsList.swift
//  homework
//
//  Created by Даниил Новоселов on 12/2/19.
//  Copyright © 2019 Даниил Новоселов. All rights reserved.
//

import UIKit

class Database {
    static func getGroup() -> [Groups] {
        return [Groups(username: "NBA", avatarPath: "NBA"),
        Groups(username: "NHL", avatarPath: "NHL"),
        Groups(username: "Lakers", avatarPath: "Lakers"),
        Groups(username: "NR", avatarPath: "NR")]
    }
}

class GroupsList: UITableViewController {
    

    @IBOutlet weak var searchBar: UISearchBar!
    
    var groupList = Database.getGroup()
        
        
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
    }
   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return groupList.count
    }
    
    let index = 0
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupsTamplate", for: indexPath) as? GroupCell else {
            return UITableViewCell()
        }
        
        let username = groupList[indexPath.row].username
        cell.username.text = username
        cell.avatar.image = UIImage(named: groupList[indexPath.row].avatarPath)
        
        return cell
    }

  
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
  let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
        }
    return [delete]
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let username = groupList[indexPath.row]
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
          let viewController = storyboard.instantiateViewController(identifier: "PhotoController") as! PhotoController
        viewController.user = username.username
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        
    
}

extension GroupsList : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        groupList = Database.getGroup().filter { (groups) -> Bool in
            return searchText.isEmpty ? true : groups.username.lowercased().contains(searchText.lowercased())
            
        }
               
        tableView.reloadData()
        print(searchText)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
        
    
    }
}
