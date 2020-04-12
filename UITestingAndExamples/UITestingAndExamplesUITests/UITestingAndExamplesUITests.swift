//
//  UITestingAndExamplesUITests.swift
//  UITestingAndExamplesUITests
//
//  Created by yosshi4486 on 2020/04/12
//  Copyright © 2020 RAISO. All rights reserved.
//

import XCTest

class UITestingAndExamplesUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEmptyState() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let toggleButton = app.buttons["ToggleButton"]

        let emptyImage = app.images["EmptyImage"]
        let emptyText = app.staticTexts["EmptyText"]
        let emptyButton = app.buttons["EmptyButton"]
        
        // Empty items does not exist before toggling state.
        XCTAssertFalse(emptyImage.exists)
        XCTAssertFalse(emptyText.exists)
        XCTAssertFalse(emptyButton.exists)

        
        // Empty items exist after toggling state.
        toggleButton.tap()

        XCTAssertTrue(emptyImage.exists)
        
        XCTAssertTrue(emptyText.exists)
        XCTAssertEqual(emptyText.label, "No mutual friends to show")
        
        XCTAssertTrue(emptyButton.exists)
        XCTAssertEqual(emptyButton.label, "FIND FRIENDS")
        
        // Empty items does not exist after re-toggling state.
        emptyButton.tap()
        
        XCTAssertFalse(emptyImage.exists)
        XCTAssertFalse(emptyText.exists)
        XCTAssertFalse(emptyButton.exists)
    }

}
