//
//  iOSTechAssessmentUITests.swift
//  iOSTechAssessmentUITests
//
//  Created by VEER TIWARI on 7/27/18.
//  Copyright © 2018 VBT. All rights reserved.
//

import XCTest

class iOSTechAssessmentUITests: XCTestCase {
    
    
    var app: XCUIApplication!
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            XCUIApplication().launch()
        }
    }
    
    func testTableInteraction() {
        
        app.launch()
        let tableView = app.tables["TableViewAccessibilityIdentifier"]
        XCTAssertTrue(tableView.exists, "The fact tableview exists")
        
        // Get an array of cells
        let tableCells = tableView.cells
        if tableCells.count > 0 {
            
            let promise = expectation(description: "Wait for table view Scrolling")
            tableView.swipeUp()
            tableView.swipeDown()
            
            
            let tableCell = tableCells.element(boundBy: 0)
            XCTAssertTrue(tableCell.exists, "The cell is in place on the table")
            tableCell.tap()
            app.navigationBars.buttons.element(boundBy: 0).tap()
            
            promise.fulfill()
            waitForExpectations(timeout: 20, handler: nil)
            XCTAssertTrue(true, "Finished table view Scrolling")
            
        } else {
            XCTAssertTrue(tableCells.count == 0, "Was not able to find any table cells")
        }
        
    }
    
}
