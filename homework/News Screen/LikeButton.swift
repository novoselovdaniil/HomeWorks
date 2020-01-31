//
//  LikeButton.swift
//  homework
//
//  Created by Даниил Новоселов on 12/17/19.
//  Copyright © 2019 Даниил Новоселов. All rights reserved.
//

import UIKit

class LikeButton : UIButton {
    var liked: Bool = false {
        didSet {
            if liked {
                setLiked()
            } else {
                disableLike()
            }
        }
    }
    
    var likeCount = 0
    
    func setLiked() {
        likeCount += 1
        setImage(UIImage(named: "images"), for: .normal)
        setTitle(String(describing: likeCount), for: .normal)
    }
    
    func disableLike() {
        likeCount -= 1
        setImage(UIImage(named: "heart-1"), for: .normal)
        setTitle(String(describing: likeCount), for: .normal)
    }
}

