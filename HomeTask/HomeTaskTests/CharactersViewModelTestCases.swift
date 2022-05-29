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
    
    func testFilterListWithNotNil(){
        XCTAssertNotNil(charViewModel.filteredListOfChars)
    }
    func testFilterListWithEqual(){
        XCTAssertEqual(charViewModel.filteredListOfChars?.count, 0)
    }
    func testFilterListWithNil(){
        XCTAssertNotNil(charViewModel.filteredListOfChars)
    }
    
    func testFilteringMethodWithEqual(){
        charViewModel.movieList = []
        charViewModel.filteringData(searchText: "test") {
            XCTAssertEqual(self.charViewModel.movieList.count, self.charViewModel.filteredListOfChars?.count)
        }
    }
    
}
