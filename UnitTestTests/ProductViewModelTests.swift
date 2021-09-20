//
//  ProductViewModelTests.swift
//  UnitTestTests
//
//  Created by hany karam on 9/20/21.
//

import XCTest

@testable import UnitTest
class ProductViewModelTests: XCTestCase {
    var sut: APIClient?
    var viewModel :ProductViewModel?
    override func setUp() {
        super.setUp()
        sut = APIClient()
        viewModel = ProductViewModel()
    }
    override func tearDown() {
        sut = nil
        viewModel = nil
        super.tearDown()
    }
    func test_fetch_data() {
        // Given A apiservice
        let sut = self.sut!
        // When fetch popular data
        let expect = XCTestExpectation(description: "callback")
        let placesRequest = SimpleGetRequest(url: URls().allProducts,parameters: nil, method: .post)
        sut.sentRequest(request: placesRequest, mapResponseOnType: GetProduct.self, successHandler: {(response)  in
            expect.fulfill()
            XCTAssertEqual( response.data.count, 10)
            for data in  response.data {
                XCTAssertNotNil(data.id)
            }
            
        }){ (error) in
            expect.fulfill()
            assert(false)
        }
        
        wait(for: [expect], timeout: 3.1)
    }
    
}
