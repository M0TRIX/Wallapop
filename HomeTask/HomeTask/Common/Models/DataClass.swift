//
//  DataClass.swift
//  HomeTask
//
//  Created by Ali Asadi on 3/3/1401 AP.
//

import Foundation

struct DataClass: Codable {
    let offset, limit, total, count: Int
    let results: [Result]
}
