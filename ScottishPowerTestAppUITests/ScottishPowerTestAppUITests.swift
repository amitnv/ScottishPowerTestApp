//
//  ScottishPowerTestAppUITests.swift
//  ScottishPowerTestAppUITests
//
//  Created by Amit Vaidya on 02/12/2021.
//

import XCTest

class ScottishPowerTestAppUITests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let app = XCUIApplication()
        app.launchArguments = ["enable-testing"]
        app.launch()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSelectTrack() {
        let app = XCUIApplication()
        
        //tap the first cell of the table view
        let firstCell = app.tables.children(matching:.any).element(boundBy: 0)
        firstCell.tap()
        
        //if the segue works as desired, then the next screen should have a button called 'More details'
        XCTAssertTrue(app.buttons["More details"].exists)
    }
    
    func testTouchMoreDetails() {
        let app = XCUIApplication()
        
        //tap the first cell of the table view
        let firstCell = app.tables.children(matching:.any).element(boundBy: 0)
        firstCell.tap()
        
        //tap the more details button
        app.buttons["More details"].tap()
        
        //if the button works as desired, then the app opens the browser and the More Details button is gone from the screen
        XCTAssertFalse(app.buttons["More details"].waitForExistence(timeout: 10))
    }
    
    func testGoBackToTracksScreen() {
        let app = XCUIApplication()
        
        //tap the first cell of the table view
        let firstCell = app.tables.children(matching:.any).element(boundBy: 0)
        firstCell.tap()
        
        //get back button from navigation bar
        let backButton = app.navigationBars["ScottishPowerTestApp.TrackDetailView"].buttons["Back"]
        backButton.tap()
        
        //if the back button work as desired, then the screen should show 'Rock Tracks' as a title
        XCTAssertTrue(app.staticTexts["Rock Tracks"].exists)
    }
    
    
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
