

import UIKit


struct FriendsResponse: Decodable {
    let response: FriendData

}

struct FriendData: Decodable  {
    let items: [FriendItem]
}

struct FriendItem: Decodable {
    let id: Int
    let firstName, lastName: String
    let photo50: String
    let online: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case photo50 = "photo_50"
        case online
        
    }
}

extension FriendsResponse {
    func toFriends() -> [User] {
        var friends = [User]()
        response.items.forEach { (friendItem) in
            friends.append(User(firstName: friendItem.firstName, lastName: friendItem.lastName, avatarPath: friendItem.photo50))
        }
        return friends
    }
}
