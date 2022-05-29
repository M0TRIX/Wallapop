//
//  DomainTestCases.swift
//  HomeTaskTests
//
//  Created by Ali Asadi on 3/9/1401 AP.
//

import XCTest
@testable import HomeTask


class DomainTestCases: XCTestCase {

    let domain = Domain()

    override func setUp() {
        super.setUp()
    }

    func testAddress(){
        XCTAssertEqual(domain.getDomain(), domain.address)
    }
    func testAddressNotNil(){
        XCTAssertNotNil(domain.getDomain())
    }
    func testSubAddress(){
        XCTAssertEqual(domain.getsubDomain(), domain.subAddress)
    }
    func testSubAddressNotNil(){
        XCTAssertNotNil(domain.getsubDomain())
    }
    func testFullDomain(){
        XCTAssertEqual(domain.getFullDomain(), domain.address + domain.subAddress)
    }
    func testFullDomainSubAddressNotNil(){
        XCTAssertNotNil(domain.getFullDomain())
    }
    func testHash(){
        XCTAssertEqual(domain.getHash(), domain.getmd5Of(domain.ts + domain.private_key + domain.public_key))
    }
    func testHashNotNil(){
        XCTAssertNotNil(domain.getHash())
    }
    func testgetmd5Of(){
        XCTAssertNotEqual(domain.getmd5Of("testString"), "testString")
    }
    func testgetmd5OfNotNil(){
        XCTAssertNotNil(domain.getmd5Of("testString"))
    }
}
