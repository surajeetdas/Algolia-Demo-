//
//  AlgoliaDemoTests.swift
//  AlgoliaDemoTests
//
//  Created by Vantage Circle on 30/08/22.
//

import XCTest
@testable import AlgoliaDemo

class AlgoliaDemoTests: XCTestCase {
    var dataRepository : DataRepository?
    var query : String?

    override func setUpWithError() throws {
        dataRepository = DataRepository()
        query = ""
    }

    override func tearDownWithError() throws {
        do{
            try super.tearDownWithError()
        }
        dataRepository = nil
    }
    
    
//    func testMakeQueryInDataRepoShouldNotReturnNil() throws{
//        dataRepository?.makeQuery(query: query!,queryOption: QueryOptions.home) { data, error in
//            XCTAssertNotNil(data)
//            XCTAssertNil(error)
//        }
//    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
