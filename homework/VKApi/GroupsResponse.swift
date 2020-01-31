

import UIKit

struct GroupResponse: Codable {
    let response : GroupDate
}

struct GroupDate: Codable {
    let items: [GroupItem]
}

struct GroupItem: Codable {
    let id: Int
    let name: String
    let isClosed : Int
    let type: String
    let isMember: Int?
    let photo50: String
    
    enum CodingKeys : String , CodingKey {
        case id,name
        case isClosed = "is_closed"
        case type
        case isMember = "is_member"
        case photo50 = "phoro_50"
    }
}

extension GroupResponse {
    
    func toGroups() -> [Groups] {
        var groups = [Groups]()
        response.items.forEach { (groupItem) in
            guard let subscription = groupItem.isMember else {
                return
            }
            groups.append(Groups(username: groupItem.name,
                                 avatarPath: groupItem.photo50
                                 ))
        }
    return groups
    }
}
