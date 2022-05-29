//
//  SeriesCollectionViewCell.swift
//  HomeTask
//
//  Created by Ali Asadi on 3/7/1401 AP.
//

import UIKit

class SeriesCollectionViewCell:UICollectionViewCell, BaseCollectionViewCell{
    
    @IBOutlet weak var name:UILabel!
    @IBOutlet weak var resultDescription:UILabel!
    @IBOutlet weak var avatar:UIImageView!

    
    func bind(object: Any) {
        if let content = object as? Series {
            name.text = content.title
            resultDescription.text = content.resultDescription
            let ex = content.thumbnail.thumbnailExtension.rawValue
            let url = content.thumbnail.path + "." + ex
            self.avatar.loadImageByUrl(urlString: url)
        }
    }
    
}
