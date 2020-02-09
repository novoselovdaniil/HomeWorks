//
//  SearchGroups.swift
//  homework
//
//  Created by Даниил Новоселов on 12/2/19.
//  Copyright © 2019 Даниил Новоселов. All rights reserved.
//

import UIKit

class SearchGroups: UITableViewController {

     let groupList = ["group1","group2","group3","group4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
      

   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return groupList.count
    }

        let index = 0
           
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupTamplate", for: indexPath) as! SearchCell
        
        cell.groupname.text = groupList[indexPath.row]
               
          
        
             
               
               return cell
           }

  
    }

