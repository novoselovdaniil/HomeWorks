//
//  NewsCell.swift
//  homework
//
//  Created by Даниил Новоселов on 12/17/19.
//  Copyright © 2019 Даниил Новоселов. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var news: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var time: UILabel!
    
    @IBAction func setLike(_ sender: Any) {
        (sender as! LikeButton).liked = !(sender as! LikeButton).liked
    }
    
    @IBOutlet weak var comment: UIButton!
    @IBOutlet weak var share: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  
}
