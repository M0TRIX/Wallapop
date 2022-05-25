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
    
    init(serviceApi:ServiceApi,controller:UIViewController) {
        self.serviceApi = serviceApi
        self.controller = controller
    }
    
    func getAllCharacters(completion: @escaping ([Result]) -> ()) {
        
        serviceApi?.getAllCharacters { [weak self] landing,response,data in
            
            let responseResult = ServiceValidator.checkResposnse(response: response, data: data)
            
            if responseResult == ServiceError.SUCCESS {
                self?.movieList = landing.data!.results ?? []
                completion(landing.data!.results ?? [])
            }else{
                MessageUtill.makeMessage(title: "Network call error", body: "\(responseResult)", controller: self?.controller ?? UIViewController())
            }
        }
    }
    
    func getOneCharacter(){
        serviceApi?.getAllCharacters { [weak self] character,response,data in
            
            let responseResult = ServiceValidator.checkResposnse(response: response, data: data)
            
            if responseResult == ServiceError.SUCCESS {
                
                // complition(exercise)
            }else{
                // MessageUtill.makeMessage(title: "Network call error", body: "\(responseResult)", controller: self?.controller ?? UIViewController())
            }
        }
    }
}