//
//  GrofersAppTests.swift
//  GrofersAppTests
//
//  Created by Shenu Gupta on 08/08/20.
//  Copyright © 2020 Shenu Gupta. All rights reserved.
//

import XCTest
@testable import GrofersApp

class GrofersAppTests: XCTestCase {
    
    let groferViewModel = GrofersViewModel()
    var expectation: XCTestExpectation?
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAdvertismenetData() {
        groferViewModel.reloadAdvertismentList = { [weak self] in
            self?.expectation?.fulfill()
        }
        self.expectation =   self.expectation(description: "Data load for advertisement")
        do {
            try groferViewModel.fetchAdvertismentData()
        }
        catch {
            XCTAssertTrue(false, "Data Not Fetched")
        }
        waitForExpectations(timeout: 5, handler: nil)
        
    }
    
    func testMilkData() {
        groferViewModel.reloadMilkList = {[weak self] in
            self?.expectation?.fulfill()
        }
        self.expectation = self.expectation(description: "Load Milk Data")
        do {
            try groferViewModel.fetchAllMilkData()
        }
        catch {
            XCTAssert(false, "Unable to load Milk Data")
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testCategoryData() {
        groferViewModel.reloadCategoriesList = {[weak self] in
            self?.expectation?.fulfill()
        }
        self.expectation = self.expectation(description: "Load Category Data")
        do {
            try groferViewModel.fetchCategoriesList()
        }
        catch {
            XCTAssertTrue(false, "Unable to load Category Data")
        }
        waitForExpectations(timeout: 15, handler: nil)
    }
    
//    func testOtherCategoryData() {
//        groferViewModel.reloadOtherCategoriesList = {[weak self] in
//            self?.expectation?.fulfill()
//        }
//        self.expectation = self.expectation(description: "Load Other Category Data")
//        do {
//            try groferViewModel.fetc()
//        }
//        catch {
//           XCTAssertTrue(false, "Unable to load other category data")
//        }
//        waitForExpectations(timeout: 5, handler: nil)
//    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
