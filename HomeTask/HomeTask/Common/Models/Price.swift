//
//  Price.swift
//  HomeTask
//
//  Created by Ali Asadi on 3/6/1401 AP.
//

import Foundation

struct Price: Decodable {
    let type: PriceType
    let price: Double
    
    enum CodingKeys: String, CodingKey {
        case type, price
    }
}
