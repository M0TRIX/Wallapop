//
//  Result.swift
//  HomeTask
//
//  Created by Ali Asadi on 3/3/1401 AP.
//

import Foundation

struct Result: Decodable {
    var id: Int?
    var name, resultDescription: String?
    var modified: String?
    var thumbnail: Thumbnail?
    var resourceURI: String?
    var comic:Comic?
    var series: Comic?
    var story: Story?
    var events: Comic?
    var urls: [URLElement]?

    enum CodingKeys: String, CodingKey {
        case id, name
        case resultDescription = "description"
        case comic = "comics"
        case story = "stories"
        case modified
        case thumbnail
        case resourceURI, series
        case events, urls
    }
    init() {
    }
}
