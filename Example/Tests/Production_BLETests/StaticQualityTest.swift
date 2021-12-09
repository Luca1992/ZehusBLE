//
//  StaticQuelityTest.swift
//  ProductionAndDiagnosticTests
//
//  Created by Andrea Finollo on 11/03/2019.
//  Copyright © 2019 Andrea Finollo. All rights reserved.
//

import XCTest
@testable import Pods_ProvaPod_Tests

class StaticQuelityTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

//    func testBatteryStaticCurrent() {
//        do {
//            try Diagnostic.Expression.batteryStaticCurrent(batteryCurrent: -0.32)
//            XCTAssertTrue(true)
//        } catch let error {
//            print(error)
//            XCTAssertTrue(false)
//        }
//        do {
//            try Diagnostic.Expression.batteryStaticCurrent(batteryCurrent: -0.52)
//            XCTAssertTrue(false)
//        } catch let error {
//            print(error)
//            XCTAssertTrue(true)
//        }
//    }
//    
//    func testBatteryStaticVoltage() {
//        do {
//            try Diagnostic.Expression.batteryStaticVoltage(batteryVPack: 24)
//            XCTAssertTrue(true)
//        } catch let error {
//            print(error)
//            XCTAssertTrue(false)
//        }
//        do {
//            try Diagnostic.Expression.batteryStaticVoltage(batteryVPack: 22)
//            XCTAssertTrue(false)
//        } catch let error {
//            print(error)
//            XCTAssertTrue(true)
//        }
//    }
    
    func testDriverTempature() {
        do {
            try Diagnostic.Expression.driverTemperature(temp: 24)
            XCTAssertTrue(true)
        } catch let error {
            print(error)
            XCTAssertTrue(false)
        }
        do {
            try Diagnostic.Expression.driverTemperature(temp: 101)
            XCTAssertTrue(false)
        } catch let error {
            print(error)
            XCTAssertTrue(true)
        }
    }
    
    func testPartialKM() {
        do {
            try Diagnostic.Expression.partialKm(km: Float.ulpOfOne)
            XCTAssertTrue(true)
        } catch let error {
            print(error)
            XCTAssertTrue(false)
        }
        do {
            try Diagnostic.Expression.partialKm(km: 0.0001)
            XCTAssertTrue(false)
        } catch let error {
            print(error)
            XCTAssertTrue(true)
        }
    }
    
    func testTotalKM() {
        do {
            try Diagnostic.Expression.totalKm(km: 0.0)
            XCTAssertTrue(true)
        } catch let error {
            print(error)
            XCTAssertTrue(false)
        }
        do {
            try Diagnostic.Expression.totalKm(km: 0.0001)
            XCTAssertTrue(false)
        } catch let error {
            print(error)
            XCTAssertTrue(true)
        }
    }

//    func testBatteryPackTIStatus() {
//        do {
//            try Diagnostic.Expression.batteryPackTIStatus(status: 192)
//            XCTAssertTrue(true)
//        } catch let error {
//            print(error)
//            XCTAssertTrue(false)
//        }
//        do {
//            try Diagnostic.Expression.batteryPackTIStatus(status: 1)
//            XCTAssertTrue(false)
//        } catch let error {
//            print(error)
//            XCTAssertTrue(true)
//        }
//    }
//
//    func testBmsState() {
//        do {
//            try Diagnostic.Expression.bmsState(status: 2)
//            XCTAssertTrue(true)
//        } catch let error {
//            print(error)
//            XCTAssertTrue(false)
//        }
//        do {
//            try Diagnostic.Expression.bmsState(status: 1)
//            XCTAssertTrue(false)
//        } catch let error {
//            print(error)
//            XCTAssertTrue(true)
//        }
//    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
