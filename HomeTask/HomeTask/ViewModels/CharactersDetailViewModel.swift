//
//  CharactersDetailViewModel.swift
//  HomeTask
//
//  Created by Ali Asadi on 3/6/1401 AP.
//

import Foundation
import UIKit

class CharactersDetailViewModel:CharactersDetailProtocols{
    
    var seriesList: [Series]?
    var comicList: [Comics]?
    var storiesList: [Stories]?
    var serviceApi: ServiceApi?
    var controller: UIViewController?
    
    var totalElementComics: Int?
    var offsetComics: Int?
    var limitComics: Int?
    var pageComics: Int?
    var isLoadingComics: Bool?
    
    var totalElementSeries: Int?
    var offsetSeries: Int?
    var limitSeries: Int?
    var pageSeries: Int?
    var isLoadingSeries: Bool?
    
    var totalElementStories: Int?
    var offsetStories: Int?
    var limitStories: Int?
    var pageStories: Int?
    var isLoadingStories: Bool?
    
    init(serviceApi:ServiceApi,controller:UIViewController,comicList:[Comics],seriesList:[Series],storiesList:[Stories]) {
        self.serviceApi = serviceApi
        self.controller = controller
        self.comicList = comicList
        self.seriesList = seriesList
        self.storiesList = storiesList
    }
    
    func getAllComics(comicCollectionUrl:String,completion: @escaping ([Comics]) -> ()) {
        self.isLoadingComics = true
        serviceApi?.getAllComicsByCharacter(offset:self.offsetComics ?? 0,url: comicCollectionUrl, completion: { landing, response, data in
            
            let responseResult = ServiceValidator.checkResposnse(response: response, data: data)
            self.isLoadingComics = false
            
            if responseResult == ServiceError.SUCCESS {
                self.comicList = (self.comicList ?? [] ) + (landing.data!.results ?? [])
                completion(landing.data!.results ?? [])
            }else{
                MessageUtill.makeMessage(title: "Network call error", body: "\(responseResult)", controller: self.controller ?? UIViewController())
            }
            
        })
    }
    
    func getAllSeries(serieCollectionUrl:String,completion: @escaping ([Series]) -> ()) {
        
        serviceApi?.getAllSeries(url: serieCollectionUrl, completion: { landing, response, data in
            let responseResult = ServiceValidator.checkResposnse(response: response, data: data)
            
            if responseResult == ServiceError.SUCCESS {
                self.seriesList = (self.seriesList ?? []) + (landing.data!.results ?? [])
                completion(landing.data!.results ?? [])
            }else{
                MessageUtill.makeMessage(title: "Network call error", body: "\(responseResult)", controller: self.controller ?? UIViewController())
            }
        })
    }
    
    func getAllStories(storyCollectionUrl: String, completion: @escaping ([Stories]) -> ()) {
        
        serviceApi?.getAllStories(url: storyCollectionUrl, completion: { landing, response, data in
            
            let responseResult = ServiceValidator.checkResposnse(response: response, data: data)
            if responseResult == ServiceError.SUCCESS {
                self.storiesList = (self.storiesList ?? []) + (landing.data!.results ?? [])
                completion(landing.data!.results ?? [])
            }else{
                MessageUtill.makeMessage(title: "Network call error", body: "\(responseResult)", controller: self.controller ?? UIViewController())
            }
        })
    }
    
}
