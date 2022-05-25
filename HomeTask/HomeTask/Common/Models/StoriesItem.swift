//
//  StoriesItem.swift
//  HomeTask
//
//  Created by Ali Asadi on 3/3/1401 AP.
//

import Foundation

struct StoriesItem: Codable {
    let resourceURI: String
    let name: String
    let type: ItemType
    
    enum CodingKeys: String, CodingKey {
        case resourceURI, name
        case type
    }
    
}
