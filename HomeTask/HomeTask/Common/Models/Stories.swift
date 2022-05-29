//
//  Stories.swift
//  HomeTask
//
//  Created by Ali Asadi on 3/8/1401 AP.
//

import Foundation
struct Stories:Decodable {
    let id: Int
    let title, resultDescription: String
    let resourceURI: String
    let type: String
    let modified: String
    let thumbnail: Thumbnail?
    // let creators: Creators
   // let characters, series, comics, events: Result
    // let originalIssue: OriginalIssue
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case resultDescription = "description"
        case resourceURI, type, modified,thumbnail
    }
}
