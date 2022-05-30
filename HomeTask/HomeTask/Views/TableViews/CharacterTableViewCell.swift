//
//  CharacterTableViewCell.swift
//  HomeTask
//
//  Created by Ali Asadi on 3/4/1401 AP.
//

import Foundation
import UIKit

class CharacterTableViewCell:UITableViewCell, BaseTableViewCell {
    
    @IBOutlet weak var name:UILabel!
    @IBOutlet weak var resultDescription:UILabel!
    @IBOutlet weak var thumbnail:UIImageView!
    
    func bind(object: Any) {
        if let content = object as? Result {
            name.text = content.name
            resultDescription.text = content.resultDescription
            let ex = content.thumbnail?.thumbnailExtension.rawValue ?? "jpg"
            let url = (content.thumbnail?.path ?? "") + ("." + ex)
            self.thumbnail.loadImageByUrl(urlString: url)
        }
    }
}
