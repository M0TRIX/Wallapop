//
//  StoriesCollectionViewCell.swift
//  HomeTask
//
//  Created by Ali Asadi on 3/8/1401 AP.
//

import Foundation
import UIKit
class StoriesCollectionViewCell:UICollectionViewCell,BaseCollectionViewCell{
   
    @IBOutlet weak var name:UILabel!
    @IBOutlet weak var resultDescription:UILabel!
    @IBOutlet weak var date:UILabel!

    
    func bind(object: Any) {
        if let content = object as? Stories {
            name.text = content.title
            resultDescription.text = content.resultDescription
   
            self.date.text = content.modified 
        }
    }
    
}
