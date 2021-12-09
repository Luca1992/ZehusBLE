//
//  PacketTest.swift
//  ProductionAndDiagnosticTests
//
//  Created by Andrea Finollo on 11/03/2019.
//  Copyright © 2019 Andrea Finollo. All rights reserved.
//

import XCTest
@testable import Pods_ProvaPod_Tests

class QualityPacketModelTests: XCTestCase {
    
    lazy var qualityOne: Diagnostic.RawPacket = {
        var rawData = Data()
        rawData.append(Data(bytes: [0xC1, 0x00])) // packet id
        rawData.append(Data(bytes: [0x02])) // bms state = 2
        rawData.append(Data(bytes: [0x03])) // padal hall = 3
        rawData.append(Data(bytes: [0x23])) // v cell max = 35
        rawData.append(Data(bytes: [0xDD])) // v cell min = -35
        rawData.append(Data(bytes: [0x3C, 0xF6])) // BMS V Pack TI = -2500
        rawData.append(Data(bytes: [0x3C])) // ProductType = 3, BMSType = 12
        rawData.append(Data(bytes: [0x46])) // soc = 70
        rawData.append(Data(bytes: [0x3C, 0xF6])) // BMS I Pack TI = -2500
        rawData.append(Data(bytes: [0x35])) // H bridge test = 1, Motor hall test res = 1,  Motor Hall test enable = 0, Hall state = 5
        rawData.append(Data(bytes: [0x06])) // pedal position = 6
        rawData.append(Data(bytes: [0x26])) // driver FW = 38
        rawData.append(Data(bytes: [0x06])) // BMS FW = 6
        rawData.append(Data(bytes: [0x13])) // elean state = 19
        rawData.append(Data(bytes: [0x23])) // BMI status = 35
        
        return try! Diagnostic.RawPacket(bluetoothData: rawData)
    }()
    
    lazy var qualityTwo: Diagnostic.RawPacket = {
        var rawData = Data()
        rawData.append(Data(bytes: [0xC2, 0x00])) // packet id
        rawData.append(Data(bytes: [0xE9, 0x07])) // battery V pack = 20.25
        rawData.append(Data(bytes: [0x17, 0xF8])) // battery current = -20.25
        rawData.append(Data(bytes: [0x65, 0x75])) // motor speed rpm 3005.3
        rawData.append(Data(bytes: [0x01, 0x80])) // sprocket = -3276.7
        rawData.append(Data(bytes: [0x01, 0x80])) // aX = -327.67
        rawData.append(Data(bytes: [0xFF, 0x7F])) // ay = 327.67
        rawData.append(Data(bytes: [0xFF, 0x7F])) // ay = 327.67
        rawData.append(Data(bytes: [0xF7])) // BMS Temp 247°
        rawData.append(Data(bytes: [0xF6])) // Driver Temp 246°
        
        return try! Diagnostic.RawPacket(bluetoothData: rawData)
    }()
    
    lazy var qualityThree: Diagnostic.RawPacket = {
        var rawData = Data()
        rawData.append(Data(bytes: [0xC3, 0x00])) // packet id
        rawData.append(Data(bytes: [0x01, 0x80])) // Motor current = -327.67
        rawData.append(Data(bytes: [0xFF, 0xFF])) // Fault1 = 65535
        rawData.append(Data(bytes: [0x00, 0x00])) // Fault2 = 0
        rawData.append(Data(bytes: [0xFF, 0xFF])) // Total km = 6553.5
        rawData.append(Data(bytes: [0xFF, 0xFF])) // Partial km = 6553.5
        
        return try! Diagnostic.RawPacket(bluetoothData: rawData)
    }()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDebugOneModel() {
        let pck = try! Diagnostic.PacketBuilder.build(qualityOne)
        XCTAssertTrue(pck.packetType == .qualityTestOnePck)
        let dbgOne = pck as! Diagnostic.QualityTestOnePacket
        XCTAssertTrue(dbgOne.bmsState == 2)
        XCTAssertTrue(dbgOne.pedalHall == 3)
        XCTAssertTrue(dbgOne.vCellMin == -3.5)
        XCTAssertTrue(dbgOne.vCellMax == 3.5)
        XCTAssertTrue(dbgOne.bmsVPackTIRaw == -250.0)
        XCTAssertTrue(dbgOne.productType == 3)
        XCTAssertTrue(dbgOne.bmsType == 12)
        XCTAssertTrue(dbgOne.soc == 70)
        XCTAssertTrue(dbgOne.bmsIPackRaw == -250.0)
        XCTAssertTrue(dbgOne.hBridgeTestResult == 0x01)
        XCTAssertTrue(dbgOne.hallTestResult == 0x01)
        XCTAssertTrue(dbgOne.hallTestEnable == 0x00)
        XCTAssertTrue(dbgOne.hallState == 0x05)
        XCTAssertTrue(dbgOne.pedalPosition == 0x06)
        XCTAssertTrue(dbgOne.fwVersion == 3.8)
        XCTAssertTrue(dbgOne.bmsFWVersion == 6)
        XCTAssertTrue(dbgOne.eleanState == 19)
        XCTAssertTrue(dbgOne.bmsTIStatus == 35)
        
        print(pck)
    }
    
    func testDebugTwoModel() {
        let pck = try! Diagnostic.PacketBuilder.build(qualityTwo)
        XCTAssertTrue(pck.packetType == .qualityTestTwoPck)
        let dbgTwo = pck as! Diagnostic.QualityTestTwoPacket
        XCTAssertTrue(dbgTwo.batteryVPack == 20.25)
        XCTAssertTrue(dbgTwo.batteryCurrent == -20.25)
        XCTAssertTrue(dbgTwo.motorSpeedRPM == 3005.3)
        XCTAssertTrue(dbgTwo.sprocketSpeedRPM == -327.67)
        XCTAssertTrue(dbgTwo.accX == -327.67)
        XCTAssertTrue(dbgTwo.accY == 327.67)
        XCTAssertTrue(dbgTwo.accZ == 327.67)
        XCTAssertTrue(dbgTwo.bmsTemperature == 247)
        XCTAssertTrue(dbgTwo.driverTemperature == 246)
        
        print(pck)
    }
    
    func testDebugThreeModel() {
        let pck = try! Diagnostic.PacketBuilder.build(qualityThree)
        XCTAssertTrue(pck.packetType == .qualityTestThreePck)
        let dbgThree = pck as! Diagnostic.QualityTestThreePacket
        XCTAssertTrue(dbgThree.motorCurrent == -327.67)
        XCTAssertTrue(dbgThree.faultOne.rawValue == 65535)
        XCTAssertTrue(dbgThree.faultTwo.rawValue == 0)
        XCTAssertTrue(dbgThree.partialKm == 6553.5)
        XCTAssertTrue(dbgThree.totalKm == 6553.5)
        
        print(pck)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
