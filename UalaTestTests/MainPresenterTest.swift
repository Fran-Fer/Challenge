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
  var url: URL!
  
  override func setUp() {
    super.setUp()
    sut = MockMainPresenter()
    sut.interactor = MockMainInteractor()
    sut.router = MockMainRouter()
    sut.view = MockMainView()
    
    url = URL(string: "www.google.com") // a better URL could be implemented to test calls
  }
  
  override func tearDown() {
    sut = nil
    super.tearDown()
  }
  
  func test_callParseData_returnSuccess() {
    sut.fetchParsedData()
    XCTAssertTrue(sut.calledFetchParsedData)
  }
  
  func test_callDidFetch_returnSuccess() {
    sut.didFetchRecipeData(with: MealList(meals: mockMeals))
    XCTAssertTrue(sut.calledDidFetchRecipeData)
  }
  
  func test_failedToFetch_returnsSuccess() {
    sut.failedToFetchData()
    XCTAssertTrue(sut.calledFailedToFetchData)
  }
  
  func test_sendToDish_returnSuccess() {
    guard let view = sut.view?.navigationController else { return }
    sut.sendToDishDetail(with: mockMeals[0], imageData: Data(), view: view)
    XCTAssertTrue(sut.sentToDishDetail)
  }
  
  func test_fetchThumb_returnsSuccess() {
    sut.fetchThumbImage(url: url)
    XCTAssertTrue(sut.fetchedThumbImage)
  }
  
  func test_didFetchThumb_returnsSuccess() {
    sut.didFetchThumbImage(url: url, data: Data(), isRandom: false)
    XCTAssertTrue(sut.calledDidFetchThumbmImage)
  }
  
  func test_returnThumbImage_returnSuccess() {
    sut.returnThumbImage(url: url)
    XCTAssertTrue(sut.returnedThumbImage)
  }
  
  func test_didFetchRandomImage_returnsSuccess() {
    sut.didFetchRandomImage(url: url)
    XCTAssertTrue(sut.didFetchRandomImage)
  }
  
  func test_fetchRandom_returnsSuccess() {
    sut.fetchRandom()
    XCTAssertTrue(sut.didFetchRandom)
  }
  
  func test_failedImage_returnsSuccess() {
    sut.failedImage()
    XCTAssertTrue(sut.didFailImage)
  }
}

// MARK: -  Mock model
var mockMeals: [Meal] = {
  return [Meal(idMeal: "1234", strMeal: "mock meal", strDrinkAlternate: nil, strCategory: "mock", strArea: "uala", strInstructions: "first, do...", strMealThumb: nil, strTags: "mock tag", strYoutube: nil, strIngredient1: "1i", strIngredient2: "2i", strIngredient3: "3i", strIngredient4: "4i", strIngredient5: "5i", strIngredient6: "6i", strIngredient7: "7i", strIngredient8: "8i", strIngredient9: nil, strIngredient10: nil, strIngredient11: nil, strIngredient12: nil, strIngredient13: nil, strIngredient14: nil, strIngredient15: nil, strIngredient16: nil, strIngredient17: nil, strIngredient18: nil, strIngredient19: nil, strIngredient20: nil, strMeasure1: "1m", strMeasure2: "2m", strMeasure3: "3m", strMeasure4: "4m", strMeasure5: "5m", strMeasure6: "6m", strMeasure7: "7m", strMeasure8: "8m", strMeasure9: "9m", strMeasure10: "10m", strMeasure11: nil, strMeasure12: nil, strMeasure13: nil, strMeasure14: nil, strMeasure15: nil, strMeasure16: nil, strMeasure17: nil, strMeasure18: nil, strMeasure19: nil, strMeasure20: nil, strSource: nil, strImageSource: nil, strCreativeCommonsConfirmed: nil, dateModified: nil)]
}()
