//
//  Comics.swift
//  HomeTask
//
//  Created by Ali Asadi on 3/6/1401 AP.
//

import Foundation

struct Comics: Decodable {
    let id, digitalID: Int?
    let title: String
    let issueNumber: Int
    let variantDescription: String
    let resultDescription: String?
    let modified, isbn, upc, diamondCode: String?
    let ean, issn: String?
    let format: String?
    let pageCount: Int?
    // let textObjects: [TextObject]
    let resourceURI: String?
    let urls: [URLElement]?
     let serie: Serie
    let variants: [Serie]
      //let collections, collectedIssues: [JSONAny]
    // let dates: [DateElement]
    let prices: [Price]
    let thumbnail: Thumbnail
    let images: [Thumbnail]
    // let creators: Creators
   //  let characters: Characters
    let storie: Story
    // let events: Characters
    
    enum CodingKeys: String, CodingKey {
        case id
        case digitalID = "digitalId"
        case title, issueNumber, variantDescription
        case resultDescription = "description"
        case modified,isbn, upc, diamondCode
        case ean, issn,format, pageCount,resourceURI, urls
        case prices, thumbnail,images ,storie = "stories"
        case serie = "series" , variants
    }
}
