//
//  DataClass.swift
//  HomeTask
//
//  Created by Ali Asadi on 3/3/1401 AP.
//

import Foundation

struct DataClass: Decodable {
    let offset, limit, total, count: Int?
    let results: [Result]?
    
    enum CodingKeys: String, CodingKey {
        case offset, limit, total, count
        case results
    }
    
}
