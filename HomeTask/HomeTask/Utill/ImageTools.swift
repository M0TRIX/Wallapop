//
//  ImageTools.swift
//  HomeTask
//
//  Created by Ali Asadi on 3/4/1401 AP.
//

import UIKit

extension UIImageView {
    
    func loadImageByUrl(urlString : String) {
        
        guard let url = URL(string: urlString) else {return}
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self else {
                return
            }
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }
        }
    }
}
