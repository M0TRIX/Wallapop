//
//  Extension.swift
//  HomeTask
//
//  Created by Ali Asadi on 3/3/1401 AP.
//

import Foundation

enum Extension: String, Decodable {
    case gif = "gif"
    case jpg = "jpg"
    
    init(from decoder: Decoder) throws {
        let label = try decoder.singleValueContainer().decode(String.self)
        self = Extension(rawValue: label) ?? .jpg
    }
}
