//
//  PublishedTests.swift
//  BillSpliterTests
//
//  Created by HubertMac on 13/10/2023.
//


@testable import BillSpliter
import XCTest

final class PublishedTests: XCTestCase {
    
    var sut: Bill!
    
    override func setUp() {
        sut = Bill()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    
    
    // test @Published checkAmount
    func test_checkAmountChangesArePublished() {
        XCTAssertSendsChangeNotification(sut.checkAmount = 10, from: sut,
                                         "Changing the value of Bill.checkAmount should trigger a change notification ")
    }
    
    
    // test @Published noOfPeople
    func test_noOfPeopleChangesArePublished() {
        XCTAssertSendsChangeNotification(sut.noOfPeople = 14, from: sut,
                                         "Changing the value of Bill.noOfPeople should trigger a change notification ")
    }
    
    // test @Published tipAmountinPercent
    func test_tipAmountinPercentChangesArePublished() {
        XCTAssertSendsChangeNotification(sut.tipAmountinPercent = 30, from: sut,
                                         "Changing the value of Bill.tipAmountinPercent should trigger a change notification ")
    }
    
    // test @Published tipAmountinChash
    func test_tipAmountinCashChangesArePublished() {
        XCTAssertSendsChangeNotification(sut.tipAmountinCash = 50, from: sut,
                                         "Changing the value of Bill.tipAmountinCash should trigger a change notification ")
    }
    
    // test @Published isTipInPercent
    func test_isTipInPercentChangesArePublished() {
        XCTAssertSendsChangeNotification(sut.isTipInPercent = false, from: sut,
                                         "Changing the value of Bill.isTipInPercent should trigger a change notification ")
    }
}


func XCTAssertSendsChangeNotification<T, U: ObservableObject>(_ expression: @autoclosure () -> T, from object: U, _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line ) {
    
    var changePublished = false
    
    let checker = object.objectWillChange.sink { _ in
        changePublished = true
    }
    
    _ = checker
    _ = expression()
    
    XCTAssertTrue(changePublished, message(), file: file, line: line)
}
