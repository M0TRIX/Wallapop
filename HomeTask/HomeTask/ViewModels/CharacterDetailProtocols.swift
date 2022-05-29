//
//  CharacterDetailProtocols.swift
//  HomeTask
//
//  Created by Ali Asadi on 3/6/1401 AP.
//

import Foundation
import UIKit

protocol CharactersDetailProtocols {
    var serviceApi:ServiceApi? { get set }
    var controller:UIViewController? { get set }
    var comicList: [Comics]? { get set }
    var seriesList: [Series]? { get set }
    var storiesList: [Stories]? {get set}
    func getAllComics(comicCollectionUrl:String,completion:@escaping([Comics])->())
    func getAllSeries(serieCollectionUrl:String,completion:@escaping([Series])->())
    func getAllStories(storyCollectionUrl:String,completion:@escaping([Stories])->())
}
