

import UIKit
import Alamofire

enum RequestError: Error {
    case failedRequest(message: String)
    case decodableError
}

class VKApi {
    
    private let vkURL = "https://api.vk.com/method/"
    
    func requestServer<T: Decodable>(requestURL: String,
                                     params: Parameters,
                                     completion: @escaping (Swift.Result<T, Error>) -> Void) {
        Alamofire.request(requestURL,
                          method: .post,
                          parameters: params)
            .responseData { (response) in
            switch response.result {
            case .failure(let error):
                completion(.failure(RequestError.failedRequest(message: error.localizedDescription)))
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(response))
                } catch let error {
                    completion(.failure(RequestError.decodableError))
                }
    }
    
        func getFriendList(token: String, result : @escaping (Swift.Result<[User], Error>) -> Void) {
            let requestURL = self.vkURL + "friends.get"
        
            let params = ["access_token": token,
                          "order": "name",
                          "fields": "city,domain",
                          "v": "5.103"] as [String: Any]
                
            self.requestServer(requestURL: requestURL, params: params) { (users: Swift.Result<FriendsResponse, Error>) in
                    switch users {
                    case .failure(let error):
                        result(.failure(error))
                    case .success(let friends):
                        result(.success(friends.toFriends()))
                    
                }
                
            }
                
        
            
    }
    
        func getPhoto(token: String, result: @escaping (Swift.Result<[Photo], Error>) -> Void) {
            let requestURL = self.vkURL + "photos.get"
        
        let params = ["access_token": token,
                      "photo_ids": "",
                      "feed_type": "photo",
                      "v": "5.103"]
        self.requestServer(requestURL: requestURL, params: params) { (users: Swift.Result<PhotosResponse, Error>) in
        switch users {
        case .failure(let error):
            result(.failure(error))
        case .success(let friends):
            result(.success(friends.toPhotos()))
            }
        }
    }
    
    func getGroup(token: String, result: @escaping (Swift.Result<[Groups], Error>) -> Void)  {
        let requestURL = self.vkURL + "groups.get"
        
        let params = ["access_token": token,
                      "filter": "groups, publics, events",
                      "fields": "city,domain",
                      "v": "5.103"]
        self.requestServer(requestURL: requestURL, params: params) { (users: Swift.Result<GroupResponse, Error>) in
        switch users {
        case .failure(let error):
            result(.failure(error))
        case .success(let friends):
            result(.success(friends.toGroups()))
            }
        }
    }
        func getGroupSearch(token: String, groupName: String) {
            let requestURL = self.vkURL + "groups.search"
                           
            let params = ["access_token": token,
                        "type": "group, page, event",
                        "q": "",
                        "country_id": 0,
                        "city_id": 0 ,
                        "v": "5.103"] as [String : Any]
                           
                           Alamofire.request(requestURL,
                                             method: .post,
                                             parameters: params).responseJSON { (response) in
                                               print(response.value)
                           }
                       }
                }
}

}
