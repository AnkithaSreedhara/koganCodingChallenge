//
//  koganCodingChallengeTests.swift
//  koganCodingChallengeTests
//
//  Created by Anki on 12/03/21.
//

import XCTest
@testable import koganCodingChallenge

class koganCodingChallengeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

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
    func testGetMoviesWithExpectedURLHostAndPath() {
      let apiRespository = APIService()
      let mockURLSession  = MockURLSession()
      apiRespository.session = mockURLSession
        apiRespository.apiToGetProducts(path: Strings.initialPath, completion: { products in
            
            if products.objects?.count == 0
            {
                XCTFail("Fail")
            }
        })
    }
}
