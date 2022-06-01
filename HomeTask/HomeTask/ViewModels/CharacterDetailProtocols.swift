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
    
    var totalElementComics:Int? {get set}
    var offsetComics:Int? {get set}
    var limitComics: Int? {get set}
    var pageComics: Int? {get set}
    var isLoadingComics:Bool? {get set}
    
    var totalElementSeries:Int? {get set}
    var offsetSeries:Int? {get set}
    var limitSeries: Int? {get set}
    var pageSeries: Int? {get set}
    var isLoadingSeries:Bool? {get set}
    
    var totalElementStories:Int? {get set}
    var offsetStories:Int? {get set}
    var limitStories: Int? {get set}
    var pageStories: Int? {get set}
    var isLoadingStories:Bool? {get set}
    
    func getAllComics(comicCollectionUrl:String,completion:@escaping([Comics])->())
    func getAllSeries(serieCollectionUrl:String,completion:@escaping([Series])->())
    func getAllStories(storyCollectionUrl:String,completion:@escaping([Stories])->())
}
