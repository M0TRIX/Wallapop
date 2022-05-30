//
//  CharactersViewModelTestCases.swift
//  HomeTaskTests
//
//  Created by Ali Asadi on 3/9/1401 AP.
//

import XCTest
@testable import HomeTask

class CharactersViewModelTestCases: XCTestCase {
    
    var charViewModel = CharactersViewModel(serviceApi: ServiceApi(), controller: UIViewController(),movieList: [],filteredListOfChars: [])
    
    override func setUp() {
        super.setUp()
    }

    func testServiceApiWithNotNil(){
        XCTAssertNotNil(charViewModel.serviceApi)
    }
    func testMovieListWithEqual(){
        XCTAssertEqual(charViewModel.movieList.count, 0)
    }
    func testMovieListWithNil(){
        XCTAssertNotNil(charViewModel.movieList)
    }

    func testFilterListWithEqual(){
        XCTAssertEqual(charViewModel.filteredListOfChars?.count ?? 0, 0)
    }

    func testFilteringMethodWithEqual(){
        charViewModel.movieList = []
        charViewModel.filteringData(searchText: "") {
            XCTAssertEqual(self.charViewModel.movieList.count, self.charViewModel.filteredListOfChars?.count)
        }
    }
    
    func testFilteringMethodWithData(){
        var result = Result()
        result.id = 1
        result.name = "barcelona"
        result.resultDescription = "capital of Spain"

        var result2 = Result()
        result2.id = 2
        result2.name = "madrid"
        result2.resultDescription = "one of largest city in Spain"

        var result3 = Result()
        result3.id = 3
        result3.name = "valencia"
        result3.resultDescription = "city of tourist"

        var list = [Result]()
        list.append(result)
        list.append(result2)
        list.append(result3)

        charViewModel.movieList = list
        charViewModel.filteringData(searchText: "bar") {
            XCTAssertNotNil(self.charViewModel.filteredListOfChars)
            XCTAssertNotEqual(self.charViewModel.filteredListOfChars?.first?.name, "bar")
        }
        charViewModel.filteringData(searchText: "london") {
            XCTAssertEqual(self.charViewModel.filteredListOfChars?.count ?? 0, 0)
        }
    }
    
}
