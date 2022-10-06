//
//  MainPresenterTest.swift
//  UalaTestTests
//
//  Created by Francisco Ferrante on 01/10/2022.
//

import XCTest
@testable import UalaTest

class MainPresenterTest: XCTestCase {
  var sut: MockMainPresenter!
  
  override func setUp() {
    super.setUp()
    sut = MockMainPresenter()
    sut.interactor = MockMainInteractor()
    sut.router = MockMainRouter()
    sut.view = MockMainView()
  }
  
  override func tearDown() {
    sut = nil
    super.tearDown()
  }
  
  func test_callParseData_returnSuccess() {
    sut.fetchParsedData()
    XCTAssertTrue(sut.calledFetchParsedData)
  }
  
}
