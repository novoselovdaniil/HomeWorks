//
//  FriendsListTableViewController.swift
//  homework
//
//  Created by Даниил Новоселов on 12/1/19.
//  Copyright © 2019 Даниил Новоселов. All rights reserved.
//

import UIKit

class FriendsListTableViewController: UITableViewController {
    
    var friendList = ["UserOne","UserTwo","UserThree","UserFour"]

    override func viewDidLoad() {
        super.viewDidLoad()

     }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendTemplate", for: indexPath)
        return cell
    }
}
