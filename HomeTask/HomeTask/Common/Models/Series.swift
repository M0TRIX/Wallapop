//
//  Series.swift
//  HomeTask
//
//  Created by Ali Asadi on 3/7/1401 AP.
//

import Foundation

struct Series: Decodable {
        let id: Int
       let title: String
       let resultDescription: String?
       let resourceURI: String
       let urls: [URLElement]
       let startYear, endYear: Int
       let rating, type: String
       let modified: String
       let thumbnail: Thumbnail
      // let creators: Creators
     //  let characters: Characters
       let storie: Story
      // let comics, events: Characters
      // let next, previous: String?

       enum CodingKeys: String, CodingKey {
           case id, title
           case resultDescription = "description"
           case resourceURI, startYear, endYear, rating, type, modified, thumbnail,urls,storie = "stories"
       }
    
}
