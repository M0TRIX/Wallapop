//
//  URLType.swift
//  HomeTask
//
//  Created by Ali Asadi on 3/3/1401 AP.
//

import Foundation

enum URLType: String, Decodable {
    case comiclink = "comiclink"
    case detail = "detail"
    case wiki = "wiki"
    
    init(from decoder: Decoder) throws {
      let label = try decoder.singleValueContainer().decode(String.self)
      self = URLType(rawValue: label) ?? .wiki
    }
}
