//
//  ComicsItem.swift
//  HomeTask
//
//  Created by Ali Asadi on 3/3/1401 AP.
//

import Foundation

struct ComicsItem: Decodable {
    let resourceURI: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case resourceURI, name
    }
}
