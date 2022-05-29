//
//  ItemType.swift
//  HomeTask
//
//  Created by Ali Asadi on 3/3/1401 AP.
//

import Foundation

enum ItemType: String, Decodable {
    case cover = "cover"
    case empty = ""
    case interiorStory = "interiorStory"
    
    init(from decoder: Decoder) throws {
      let label = try decoder.singleValueContainer().decode(String.self)
      self = ItemType(rawValue: label) ?? .empty
    }
    
}
