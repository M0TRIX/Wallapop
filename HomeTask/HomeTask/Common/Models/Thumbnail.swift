//
//  Thumbnail.swift
//  HomeTask
//
//  Created by Ali Asadi on 3/3/1401 AP.
//

import Foundation

struct Thumbnail: Codable {
    let path: String
    let thumbnailExtension: Extension

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}
