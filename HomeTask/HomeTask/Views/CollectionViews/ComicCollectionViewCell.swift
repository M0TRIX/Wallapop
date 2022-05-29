//
//  ComicCollectionView.swift
//  HomeTask
//
//  Created by Ali Asadi on 3/6/1401 AP.
//

import Foundation
import UIKit

class ComicCollectionViewCell:UICollectionViewCell, BaseCollectionViewCell{
    
    @IBOutlet weak var name:UILabel!
    @IBOutlet weak var resultDescription:UILabel!
    @IBOutlet weak var price:UILabel!
    @IBOutlet weak var avatar:UIImageView!

    @IBOutlet weak var mainView: UIView!
    
    func bind(object: Any) {
        if let content = object as? Comics {
            name.text = content.title
            resultDescription.text = content.resultDescription
            let ex = content.thumbnail.thumbnailExtension.rawValue
            let url = content.thumbnail.path + "." + ex
            self.avatar.loadImageByUrl(urlString: url)
        }
    }
    

}
