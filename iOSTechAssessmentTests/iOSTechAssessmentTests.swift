//
//  iOSTechAssessmentTests.swift
//  iOSTechAssessmentTests
//
//  Created by VEER TIWARI on 7/27/18.
//  Copyright © 2018 VBT. All rights reserved.
//

import XCTest
@testable import iOSTechAssessment

class iOSTechAssessmentTests: XCTestCase {
    
    
    func testAPICallUsingAPIClient() {
        
        let promise = expectation(description: "Simple Request")
        
        APIClient.shared().getData { (success, result, message) in
            switch success {
            case true :
                XCTAssertTrue(success, "data fetch successfully")
                XCTAssertTrue(result?.status == "OK")// Test status
                XCTAssertTrue(result?.results?.count == 20)// Check total result item count should be 20
                XCTAssertEqual(message, "") // Check message is a Empty String
                promise.fulfill()
            case false:
                XCTAssertFalse(success, "error in data fetching from server")
            }
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    
}
