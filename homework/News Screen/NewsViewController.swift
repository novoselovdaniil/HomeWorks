//
//  NewsViewController.swift
//  homework
//
//  Created by Даниил Новоселов on 12/17/19.
//  Copyright © 2019 Даниил Новоселов. All rights reserved.
//

import UIKit

class NewsViewController : UITableViewController {
   
    var newsArray = [News(username: "Daniil Novoselov", avatarPath: "person-male", newsText: "Привет,меня зовут Даниил.", time: "22:10"),
                     News(username: "Lakers", avatarPath: "Lakers", newsText: "Выйграли 25 матч против Денвера.", time: "12:00"),
                     News(username: "Zoey Novoselova", avatarPath: "person-female", newsText: "Today was a great day", time: "22:10"),
                     News(username: "NR", avatarPath: "NR", newsText: "Guf записал новый альбом", time: "22:10")]
    
    override func viewDidLoad() {
        tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "SimpleNews")
        
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleNews", for: indexPath) as? NewsCell else {
        return UITableViewCell()
    }
        
        
        cell.username.text = newsArray[indexPath.row].username
        cell.avatar.image = UIImage(named: newsArray[indexPath.row].avatarPath)
        cell.news.text = newsArray[indexPath.row].newsText
        cell.time.text = newsArray[indexPath.row].time
        return cell
    }
}
