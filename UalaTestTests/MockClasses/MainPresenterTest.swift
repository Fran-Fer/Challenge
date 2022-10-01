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
  }
  
  override func tearDown() {
    sut = nil
    super.tearDown()
  }
  
}
