

import UIKit

private let reuseIdentifier = "Photo"

class PhotoController: UICollectionViewController {
    var photoCollection = [1]
    var user: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    
    }



    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return photoCollection.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Photo", for: indexPath) as! PhotoCell
    
        return cell
    }
    
}

class PhotoCell : UICollectionViewCell {
    
  
    @IBOutlet weak var photo: UIImageView!
    
}

