//
//  URLElement.swift
//  HomeTask
//
//  Created by Ali Asadi on 3/3/1401 AP.
//

import Foundation

struct URLElement: Decodable {
    let type: URLType
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case url,type
    }
}
