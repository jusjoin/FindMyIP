//
//  FindMyIPTests.swift
//  FindMyIPTests
//
//  Created by Zane on 11/22/23.
//

import XCTest
@testable import FindMyIP

class FindMyIPTests: XCTestCase {
    private var sut: FindMyIPViewModel!
    private var mockService: MockFindMyIPService!

    override func setUp() {
        mockService = MockFindMyIPService()
        sut = FindMyIPViewModel(service: mockService)
    }

    override func tearDown() {
        sut = nil
        mockService = nil
    }

    func testGetDataButtonTapped_FetchDataSucceeded_StateChangedToLoaded() {
        XCTAssertEqual(sut.state, .idle)
        sut.getDataButtonTapped()
        XCTAssertEqual(sut.state, .loaded)
    }

    func testGetDataButtonTapped_FetchDataFailed_StateChangedToError() {
        mockService.isSuccess = false
        XCTAssertEqual(sut.state, .idle)
        sut.getDataButtonTapped()
        XCTAssertEqual(sut.state, .error)
    }

    func testGetDataButtonTapped_FetchDataFailed_StateChangedToError1() {
        mockService.isSuccess = false
        XCTAssertEqual(sut.state, .idle)
        sut.getDataButtonTapped()
        XCTAssertEqual(sut.state, .error)
    }
}
