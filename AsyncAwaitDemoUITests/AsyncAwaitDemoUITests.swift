//
//  AsyncAwaitDemoUITests.swift
//  AsyncAwaitDemoUITests
//
//  Created by Komal's MAC on 06/07/25.
//

import XCTest

final class AsyncAwaitDemoUITests: XCTestCase {
    @MainActor
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        
    }

    @MainActor
    func testLaunchPerformance() throws {
        // This measures how long it takes to launch your application.
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}
