//
//  Landing.swift
//  HomeTask
//
//  Created by Ali Asadi on 3/3/1401 AP.
//

import Foundation
 
struct Landing<T:Decodable>: Decodable {
    let code: Int?
    let status, copyright, attributionText, attributionHTML: String?
    let etag: String?
    let data: DataClass<T>?
    
    enum CodingKeys: String, CodingKey {
        case code, status, copyright,attributionText,attributionHTML
        case etag
        case data
    }
}
