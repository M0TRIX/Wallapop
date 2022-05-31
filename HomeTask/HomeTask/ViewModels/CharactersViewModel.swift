//
//  LandingViewModel.swift
//  HomeTask
//
//  Created by Ali Asadi on 3/3/1401 AP.
//

import Foundation
import UIKit

class CharactersViewModel:CharactersProtocols{
 
    var serviceApi:ServiceApi?
    var controller:UIViewController?
    var movieList = [Result]()
    var filteredListOfChars: [Result]?
    var totalElement: Int?
    var offset: Int?
    var limit: Int?
    var page: Int?
    var isLoading:Bool?
    
    init(serviceApi:ServiceApi,controller:UIViewController,movieList:[Result],filteredListOfChars:[Result]) {
        self.serviceApi = serviceApi
        self.controller = controller
    }
    
    func getAllCharacters(completion: @escaping ([Result]) -> ()) {
        self.isLoading = true
        serviceApi?.getAllCharacters(offset: self.offset ?? 0) { [weak self] landing,response,data in
            
            let responseResult = ServiceValidator.checkResposnse(response: response, data: data)
            self?.isLoading = false
            if responseResult == ServiceError.SUCCESS {
                self?.movieList = landing.data!.results ?? []
                self?.filteredListOfChars = (self?.filteredListOfChars ?? []) + (landing.data!.results ?? [])
                self?.totalElement = landing.data?.total
                completion(landing.data!.results ?? [])
            }else{
                MessageUtill.makeMessage(title: "Network call error", body: "\(responseResult)", controller: self?.controller ?? UIViewController())
            }
        }
    }
    
    func filteringData(searchText: String,compilition:@escaping()->()) {
        filteredListOfChars?.removeAll()
        if searchText.isEmpty {
            filteredListOfChars = movieList
        }else{
            filteredListOfChars = movieList.filter { $0.name!.contains(searchText)}
        }
        compilition()
    }
}
