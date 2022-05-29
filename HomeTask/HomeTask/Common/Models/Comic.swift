//
//  Comics.swift
//  HomeTask
//
//  Created by Ali Asadi on 3/3/1401 AP.
//

import Foundation

struct Comic: Decodable {
    let available: Int
    let collectionURI: String
    let items: [ComicsItem]
    let returned: Int
    
    enum CodingKeys: String, CodingKey {
        case available, collectionURI
        case items
        case returned
    }
}
