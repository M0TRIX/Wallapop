//
//  Serie.swift
//  HomeTask
//
//  Created by Ali Asadi on 3/6/1401 AP.
//

import Foundation

struct Serie: Codable {
    let resourceURI: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case resourceURI, name
    }
    
}
