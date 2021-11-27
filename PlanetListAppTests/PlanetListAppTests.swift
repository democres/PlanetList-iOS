//
//  PlanetListAppTests.swift
//  PlanetListAppTests
//
//  Created by David Figueroa on 11/04/21.
//

import XCTest
@testable import PlanetListApp
import Combine

class MLSearchAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let interactor = HomeInteractor()
        var cancellables = Set<AnyCancellable>()
        let expectation = self.expectation(description: "getPlanets")
        var error: Error?
        var planets = [Planet]()
        
        interactor.getPlanets()
            .sink(receiveCompletion: { [weak self] errorResponse in
                switch errorResponse {
                case .finished:
                    break
                case .failure(let encounteredError):
                    error = encounteredError
                }

                expectation.fulfill()
            }, receiveValue: { [weak self] planetsResponse in
                planets = planetsResponse
            })
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 5)
        
        XCTAssertNil(error)
        XCTAssertGreaterThan(planets.count, 1)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
