//
//  LandingViewModelProtocols.swift
//  HomeTask
//
//  Created by Ali Asadi on 3/4/1401 AP.
//

import Foundation
import UIKit

protocol CharactersProtocols {
    var serviceApi:ServiceApi? { get set }
    var controller:UIViewController? { get set }
    var movieList: [Result] { get set }
    var totalElement:Int? {get set}
    var offset:Int? {get set}
    var limit: Int? {get set}
    var page: Int? {get set}
    var isLoading:Bool? {get set}
    func getAllCharacters(completion:@escaping([Result])->())
    var filteredListOfChars:[Result]? { get set }
    func filteringData(searchText:String,compilition:@escaping()->())
}
