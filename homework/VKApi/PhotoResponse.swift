
import UIKit

struct PhotosResponse: Decodable {
    let response: PhotoData
}


struct PhotoData: Decodable {
    let items: [PhotoItem]
}

struct PhotoItem: Decodable {
    let sizes: [Size]
}

struct Size: Codable {
    let type: TypeEnum
    let url: String
    
    enum TypeEnum : String, Codable {
    
    case x = "x"
    }
}

extension PhotosResponse {
    
    func toPhotos() -> [Photo] {
        var photos = [Photo]()
        response.items.forEach { (item) in
            if let size = item.sizes.first(where: { $0.type == .x }) {
                photos.append(Photo(imageName: size.url))
                
            }
                
            
        }
        return photos
    }
}
