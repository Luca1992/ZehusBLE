//
//  DebugPacketTest.swift
//  ProductionAndDiagnosticTests
//
//  Created by Andrea Finollo on 11/03/2019.
//  Copyright © 2019 Andrea Finollo. All rights reserved.
//

import XCTest
@testable import Pods_ProvaPod_Tests

class DebugPacketTest: XCTestCase {
    
    lazy var debugOne: Diagnostic.RawPacket = {
        var rawData = Data()
        rawData.append(Data(bytes: [0xD1, 0x00])) // packet id
        rawData.append(Data(bytes: [0xFF, 0xFF])) // TotalkmSaved = 6553.5
        rawData.append(Data(bytes: [0xFF, 0xFF])) // PartialkmSaved = 6553.5
        rawData.append(Data(bytes: [0xFF, 0xFF])) // Totalkm = 6553.5
        rawData.append(Data(bytes: [0xFF, 0xFF])) // Partialkm = 6553.5
        rawData.append(Data(bytes: [0x01, 0x80])) // Motor Power = -32767
        rawData.append(Data(bytes: [0xFF, 0xFF])) // Fault1 = 65535
        rawData.append(Data(bytes: [0xFF, 0xFF])) // Fault2 = 65535
        rawData.append(Data(bytes: [0xFF])) // BT Service cmd 255
        rawData.append(Data(bytes: [0xFF])) // SoC = 255
       
        
        return try! Diagnostic.RawPacket(bluetoothData: rawData)
    }()
    
    lazy var debugTwo: Diagnostic.RawPacket = {
        var rawData = Data()
        rawData.append(Data(bytes: [0xD2, 0x00])) // packet id
        rawData.append(Data(bytes: [0xFF])) // Temperature = 255
        rawData.append(Data(bytes: [0xFF])) // SystemState = 255
        rawData.append(Data(bytes: [0xFF]))// SystemCmd = 255
        rawData.append(Data(bytes: [0xFF])) // DriverCmd = 255
        rawData.append(Data(bytes: [0x6C])) // Select modality = 6 Product State = 12
        rawData.append(Data(bytes: [0xFF, 0xFF])) // Status Flag = 65535
        rawData.append(Data(bytes: [0xFF])) // Pedal Position = 255
        rawData.append(Data(bytes: [0x01, 0x80])) // Slope = -3276.7
        rawData.append(Data(bytes: [0xFF, 0xFF])) // Wheel lenght = 65535
        rawData.append(Data(bytes: [0x01, 0x80])) // SPRocket -327.67
        rawData.append(Data(bytes: [0xFF])) // EoL front 255
        rawData.append(Data(bytes: [0xFF])) // EoL rear 255

        
        return try! Diagnostic.RawPacket(bluetoothData: rawData)
    }()

    lazy var debugThree: Diagnostic.RawPacket = {
        var rawData = Data()
        rawData.append(Data(bytes: [0xD3, 0x00])) // packet id
        rawData.append(Data(bytes: [0xFF])) // DC real fix = 255
        rawData.append(Data(bytes: [0xFF])) // Pedal hall = 255
        rawData.append(Data(bytes: [0xFF])) // First Rev State  = 7, Slope State = 7, FwFit = 3
        rawData.append(Data(bytes: [0xFF])) // Fw version = 255
        rawData.append(Data(bytes: [0x00, 0x80])) // Battery V Pack = -327.68
        rawData.append(Data(bytes: [0x00, 0x80])) // Battery Current = -327.68
        rawData.append(Data(bytes: [0xFF])) // Command state = 255
        rawData.append(Data(bytes: [0x00, 0x80])) // Speed rpm = -32768
        rawData.append(Data(bytes: [0xC7])) // hall state = 255, backward = 255
        rawData.append(Data(bytes: [0x00, 0x80])) // Motor current -327.68
        rawData.append(Data(bytes: [0xFF, 0x7F])) // Motor current set point 32767
        
        
        return try! Diagnostic.RawPacket(bluetoothData: rawData)
    }()
    
    lazy var debugFour: Diagnostic.RawPacket = {
        var rawData = Data()
        rawData.append(Data(bytes: [0xD4, 0x00])) // packet id
        rawData.append(Data(bytes: [0xFF])) //ProductType  = 255
        rawData.append(Data(bytes: [0x00, 0x80])) // SpeedKm = -327.68
        rawData.append(Data(bytes: [0x00])) // Calib 0 = 0
        rawData.append(Data(bytes: [0xFF])) // Calib 1 = 255
        rawData.append(Data(bytes: [0xFF])) // Calib 2 = 255
        rawData.append(Data(bytes: [0x00])) // Filler
        rawData.append(Data(bytes: [0xFF])) // Battery Charging cycles =  255
        
        return try! Diagnostic.RawPacket(bluetoothData: rawData)
    }()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDebugOne() {
        let pck = try! Diagnostic.PacketBuilder.build(debugOne)
        XCTAssertTrue(pck.packetType == .debugOnePck)
        let dbgOne = pck as! Diagnostic.DebugOnePacket
        XCTAssertTrue(dbgOne.totalKmSaved == 6553.5)
        XCTAssertTrue(dbgOne.partialKMSaved == 6553.5)
        XCTAssertTrue(dbgOne.totalKM == 6553.5)
        XCTAssertTrue(dbgOne.partialKM == 6553.5)
        XCTAssertTrue(dbgOne.motorPower == -32767)
        XCTAssertTrue(dbgOne.faultTwo.rawValue == 65535)
        XCTAssertTrue(dbgOne.faultOne.rawValue == 65535)
        XCTAssertTrue(dbgOne.btServiceCmd == 255)
        XCTAssertTrue(dbgOne.soc == 255)
        
        print(dbgOne)
    }

    func testDebugTwo() {
        let pck = try! Diagnostic.PacketBuilder.build(debugTwo)
        XCTAssertTrue(pck.packetType == .debugTwoPck)
        let dbgTwo = pck as! Diagnostic.DebugTwoPacket
        XCTAssertTrue(dbgTwo.temperature == 255)
        XCTAssertTrue(dbgTwo.systemState == 255)
        XCTAssertTrue(dbgTwo.systemCmd == 255)
        XCTAssertTrue(dbgTwo.driverCmd == 255)
        XCTAssertTrue(dbgTwo.selectModality == 6)
        XCTAssertTrue(dbgTwo.productState == 12)
        XCTAssertTrue(dbgTwo.statusFlag == 65535)
        XCTAssertTrue(dbgTwo.pedalPosition == 255)
        XCTAssertTrue(dbgTwo.slope == -3276.7)
        XCTAssertTrue(dbgTwo.wheelLenght == 65535)
        XCTAssertTrue(dbgTwo.spRocketSpeed == -327.67)
        XCTAssertTrue(dbgTwo.eolFrontRing == 255)
        XCTAssertTrue(dbgTwo.eolRearRing == 255)

        print(dbgTwo)
    }
    
    func testDebugThree() {
        let pck = try! Diagnostic.PacketBuilder.build(debugThree)
        XCTAssertTrue(pck.packetType == .debugThreePck)
        let dbgThree = pck as! Diagnostic.DebugThreePacket
        XCTAssertTrue(dbgThree.dcRealFix == 255)
        XCTAssertTrue(dbgThree.pedalHall == 255)
        XCTAssertTrue(dbgThree.firstRevState == 7)
        XCTAssertTrue(dbgThree.slopeState == 7)
        XCTAssertTrue(dbgThree.fwBwFilt == 3)
        XCTAssertTrue(dbgThree.batteryVPack == -327.68)
        XCTAssertTrue(dbgThree.batteryCurrent == -327.68)
        XCTAssertTrue(dbgThree.cmdState == 255)
        XCTAssertTrue(dbgThree.speedRPM == -32768)
        XCTAssertTrue(dbgThree.backward == 3)
        XCTAssertTrue(dbgThree.hallState == 7)
        XCTAssertTrue(dbgThree.motorCurrent == -327.68)
        XCTAssertTrue(dbgThree.motorCurrentSetPoint == 32767)
        
        print(dbgThree)
    }
    
    func testDebugFour() {
        let pck = try! Diagnostic.PacketBuilder.build(debugFour)
        XCTAssertTrue(pck.packetType == .debugFourPck)
        let dbgFour = pck as! Diagnostic.DebugFourPacket
        XCTAssertTrue(dbgFour.productType == 255)
        XCTAssertTrue(dbgFour.speed == -327.68)
        XCTAssertTrue(dbgFour.calibPOne == 255)
        XCTAssertTrue(dbgFour.calibPTwo == 255)
        XCTAssertTrue(dbgFour.calibPZero == 0)
        XCTAssertTrue(dbgFour.batteryChargingCycles == 255)
        
        print(dbgFour)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
