import UIKit

class User {
    var username : String
    
    var userBirthday : Int
    
    var userCity : String
    
    var friends : Int
    
    var followers : Int
    
    init(username: String, userBirthday : Int , userCity : String, friends : Int , followers : Int) {
        self.username = username
        self.userBirthday = userBirthday
        self.userCity = userCity
        self.friends = friends
        self.followers = followers
    }
}

class Groups {
    
    var username : String
    
    var topicOfGroup : String
    
    var followers : Int
    
    var friends : Int
    
    init(username: String, topicOfGroup : String,  friends : Int , followers : Int) {
            self.username = username
        self.topicOfGroup = topicOfGroup
               self.friends = friends
               self.followers = followers
    }
}
