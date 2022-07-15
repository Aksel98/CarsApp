//
//  CarInfoViewModelTests.swift
//  CarsAppTests
//
//  Created by Aksel Avetisyan on 15.07.22.
//

import XCTest
@testable import CarsApp

class CarInfoViewModelTests: XCTestCase {
    
    var viewModel = CarInfoViewModel()
    
    func testCarsInfo() {
        viewModel.fetchData()
        
        let expectation = expectation(description: "")
        
        viewModel.fetchData(complition: {
            expectation.fulfill()
            print($0)
        })
        
        waitForExpectations(timeout: 10)
        
        XCTAssertNotNil(viewModel.getImage())
        XCTAssertNotNil(viewModel.getTitle())
        XCTAssertNotNil(viewModel.getModel())
        
        // For deeper testing we can create mock service
    }
}
