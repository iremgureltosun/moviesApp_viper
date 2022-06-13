//
//  InvioAPITests.swift
//  InvioAPITests
//
//  Created by irem TOSUN on 2.06.2022.
//

import Combine
import Foundation
@testable import InvioAPI
import XCTest

class InvioAPITests: XCTestCase {
    var cancellables = Set<AnyCancellable>()

    func testEndpointReturnsData() {
        let searchService = MovieSearchService()
        let expectation = self.expectation(description: "No results in response data")
        let movieTitle = "a"

        searchService.search(by: movieTitle)
            .sink(receiveCompletion: { completion in
                switch completion {
                case let .failure(error):
                    print("Error: \(error)")
                    XCTFail("Error in the server call")
                case .finished:
                    print("All good")
                }
            }, receiveValue: { data in
                let length = data.count
                let response = String(data: data, encoding: .utf8)
                print("Response:\(String(describing: response))")
                print("We have some data.: \(length)")
                expectation.fulfill()
            })
            .store(in: &cancellables)

        waitForExpectations(timeout: 6, handler: nil)
    }
  
}
