//
//  CharactersDetailViewModelTestCases.swift
//  HomeTaskTests
//
//  Created by Ali Asadi on 3/9/1401 AP.
//

import XCTest
@testable import HomeTask

class CharactersDetailViewModelTestCases: XCTestCase {

    var charDetailViewModel = CharactersDetailViewModel(serviceApi: ServiceApi(), controller: UIViewController(),comicList: [],seriesList: [],storiesList: [])
    
    override func setUp() {
        super.setUp()
        
    }

    func testServiceApiWithNotNil(){
        XCTAssertNotNil(charDetailViewModel.serviceApi)
    }
    func testComicListWithEqual(){
        XCTAssertEqual(charDetailViewModel.comicList?.count ?? 0, 0)
    }
    func testComicListWithNil(){
        XCTAssertNotNil(charDetailViewModel.comicList)
    }

    func testSeriesListWithEqual(){
        XCTAssertEqual(charDetailViewModel.seriesList?.count ?? 0, 0)
    }
    func testSeriesListWithNil(){
        XCTAssertNotNil(charDetailViewModel.seriesList)
    }
    
    func testStoriesListWithEqual(){
        XCTAssertEqual(charDetailViewModel.storiesList?.count ?? 0, 0)
    }
    func testStoriesListWithNil(){
        XCTAssertNotNil(charDetailViewModel.storiesList)
    }
}
