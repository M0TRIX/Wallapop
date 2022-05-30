//
//  HomeTaskTests.swift
//  HomeTaskTests
//
//  Created by Ali Asadi on 3/3/1401 AP.
//

import XCTest
@testable import HomeTask

class CheckResponseTestCases: XCTestCase {
    
    var url = URL(string: "test")!
    
    override func setUp() {
        super.setUp()
        
        testCheckResponseWithSuccess()
        testCheckResponseWithForbidden()
        testCheckResponseWithBadRequest()
        testCheckResponseWithInvalidResponse()
    }
    
    func testCheckResponseWithSuccess(){
        let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: "", headerFields: ["":""])
        let result = ServiceValidator.checkResposnse(response: response!, data: Data())
        XCTAssertEqual(result, ServiceError.SUCCESS)
    }
    
    func testCheckResponseWithForbidden(){
        let response = HTTPURLResponse(url: url, statusCode: 402, httpVersion: "", headerFields: ["":""])
        let result = ServiceValidator.checkResposnse(response: response!, data: Data())
        XCTAssertEqual(result, ServiceError.FORBIDDEN)
    }
    
    func testCheckResponseWithBadRequest(){
        let response = HTTPURLResponse(url: url, statusCode: 400, httpVersion: "", headerFields: ["":""])
        let result = ServiceValidator.checkResposnse(response: response!, data: Data())
        XCTAssertEqual(result, ServiceError.BADREQUEST)
    }
    
    func testCheckResponseWithInvalidResponse(){
        let response = HTTPURLResponse(url: url, statusCode: 400, httpVersion: "", headerFields: ["":""])
        let result = ServiceValidator.checkResposnse(response: response!, data: nil)
        XCTAssertEqual(result, ServiceError.INVALIDRESPONSE)
    }
    
    func testCheckResponseWithUNAUTHORIZE(){
        let response = HTTPURLResponse(url: url, statusCode: 401, httpVersion: "", headerFields: ["":""])
        let result = ServiceValidator.checkResposnse(response: response!, data: Data.init())
        XCTAssertEqual(result, ServiceError.UNAUTHORIZE)
    }
    
    func testCheckResponseWithServerError(){
        let response = HTTPURLResponse(url: url, statusCode: 500, httpVersion: "", headerFields: ["":""])
        let result = ServiceValidator.checkResposnse(response: response!, data: Data.init())
        XCTAssertEqual(result, ServiceError.SERVERERROR)
    }
  
}
