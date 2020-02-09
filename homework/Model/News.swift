//
//  News.swift
//  homework
//
//  Created by Даниил Новоселов on 1/8/20.
//  Copyright © 2020 Даниил Новоселов. All rights reserved.
//

import UIKit

class News {
    
    var username : String
    var avatarPath : String
    var newsText : String
    var time : String
    
    init (username : String, avatarPath : String, newsText : String, time : String){
        self.username = username
        self.avatarPath = avatarPath
        self.newsText = newsText
        self.time = time
    }
        
        
}
