//
//  ConsoleTests.swift
//  ConsoleTests
//
//  Created by Trial on 2019. 07. 18.
//  Copyright © 2019. Trial All rights reserved.
//

import XCTest
@testable import Console


class ConsoleTests: XCTestCase {

    func testExample() {
        
        Console.logger.error("Error")
        XCTAssertEqual(Console.logger.getMessage(0), "Error")
        Console.logger.info("Info")
        XCTAssertEqual(Console.logger.getMessage(1), "Info")
        Console.logger.verbose("Verbose")
        XCTAssertEqual(Console.logger.getMessage(2), "Verbose")
        Console.logger.warning("warning")
        XCTAssertEqual(Console.logger.getMessage(3), "warning")

        #if os(iOS)
            XCTAssert(Console.platform == "iOS")
        #endif
        #if os(macOS)
            XCTAssert(Console.platform == "macOS")
        #endif
        #if os(tvOS)
            XCTAssert(Console.platform == "tvOS")
        #endif
        #if os(watchOS)
            XCTAssert(Console.platform == "watchOS")
        #endif
    }
}
