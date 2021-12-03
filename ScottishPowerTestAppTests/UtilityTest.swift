//
//  UtilityTest.swift
//  ScottishPowerTestAppTests
//
//  Created by Amit Vaidya on 03/12/2021.
//

import XCTest
@testable import ScottishPowerTestApp

class UtilityTest: XCTestCase {
    
    func testUtility_whenUSDisGiven_CurrencySymbolisTheOutPut() {
        //Arrange
        let sut = Utility.self
        
        //Act
        let currency = "USD"
        let expectedOutput = "$"
        let result = sut.symbolForCurrency(currency: currency)
        
        //Arrange
        XCTAssertTrue(result == expectedOutput)
    }
    
    func testDateFormatting() {
        //Arrange
        let sut = Utility.self
        
        //Act
        let rawDate = "2010-06-18T12:00:00Z"
        let expectedOutput = "18 Jun, 2010"
        let result = sut.formatDate(date: rawDate, formatFrom: AppConstants.dateFormatFromJSON, formatTo: AppConstants.dateDisplayFormat)
        
        //Arrange
        XCTAssertTrue(result == expectedOutput)
    }
    
    func testSecondsFormatting() {
        //Arrange
        let sut = Utility.self
        
        //Act
        let seconds = 356067 / 1000
        let expectedOutput = (0, 5, 56)
        let result = sut.formatSeconds(seconds: seconds)
        
        //Arrange
        XCTAssertTrue(result == expectedOutput)
    }
    
    func testPriceFormatting() {
        //Arrange
        let sut = Utility.self
        
        //Act
        let price = 1.39
        let expectedOutput = "1.39"
        let result = Utility.formatPrice(price: price)
        
        //Arrange
        XCTAssertTrue(result == expectedOutput)
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}
