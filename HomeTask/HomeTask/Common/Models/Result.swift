//
//  Result.swift
//  HomeTask
//
//  Created by Ali Asadi on 3/3/1401 AP.
//

import Foundation

struct Result: Decodable {
    let id: Int
    let name, resultDescription: String
    let modified: String
    let thumbnail: Thumbnail
    let resourceURI: String
    let comic, series: Comic
    let story: Story
    let events: Comic
    let urls: [URLElement]

    enum CodingKeys: String, CodingKey {
        case id, name
        case resultDescription = "description"
        case comic = "comics"
        case modified,thumbnail, resourceURI, series, story = "stories", events, urls
    }
    init() {
    }
}
