//
//  Stories.swift
//  HomeTask
//
//  Created by Ali Asadi on 3/3/1401 AP.
//

import Foundation

struct Stories: Codable {
    let available: Int
    let collectionURI: String
    let items: [StoriesItem]
    let returned: Int
}
