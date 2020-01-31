//
//  Session.swift
//  homework
//
//  Created by Даниил Новоселов on 1/20/20.
//  Copyright © 2020 Даниил Новоселов. All rights reserved.
//

import UIKit


class Session {
     
    static let shared = Session()
    private init () { }
    
    var token = ""
    var userId = ""
    
}
