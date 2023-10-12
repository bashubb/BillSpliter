//
//  BillSpliterTests.swift
//  BillSpliterTests
//
//  Created by HubertMac on 12/10/2023.
//
@testable import BillSpliter
import XCTest


final class BillSpliterTests: XCTestCase {

    var sut: Bill!
    
    override func setUp() {
        sut = Bill()
    }
    
    override func tearDown() {
        sut = nil
    }
    
// MARK: toggle header tests
    
    func test_toggleHeaderPercent() {
        // given
        let isTipInPrecent = true
        
        // when
        let toggleHeader = sut.toggleHeader(isTipInPercent: isTipInPrecent)
        
        //then
        XCTAssertEqual(toggleHeader,"percentage", "The header should be 'precentage'")
    }

    
    func test_toggleHeaderCash() {
        // given
        let isTipInPrecent = false
        
        // when
        let toggleHeader = sut.toggleHeader(isTipInPercent: isTipInPrecent)
        
        //then
        XCTAssertEqual(toggleHeader,"cash", "The header should be 'cash'")
    }
    

    
// MARK: tipAmount tests
    
    
    func test_tipAmountIsPrecentage() {
        //given
        let isTipInPrecent = true
        sut.tipAmountinPercent = 50
        sut.tipAmountinCash = 30
        
        // when
        let finalTipAmount = sut.tipAmount(isTipInPercent: isTipInPrecent)
        
        // then
        XCTAssertEqual(finalTipAmount, 50, "It should be equal tipAmountinPercent")
        
    }
    
    func test_tipAmountIsCash() {
        //given
        let isTipInPrecent = false
        sut.tipAmountinPercent = 50
        sut.tipAmountinCash = 30
        
        // when
        let finalTipAmount = sut.tipAmount(isTipInPercent: isTipInPrecent)
        
        // then
        XCTAssertEqual(finalTipAmount, 30, "It should be equal tipAmountinCash")
        
    }
    
    
// MARK: calculating total tests
    
    func test_calculateGrandTotal_whenTipPrecentage() {
        // given
        let isTipInPercent = true
        
        sut.checkAmount = 100
        sut.tipAmountinPercent = 25
        sut.tipAmountinCash = 75
        
        // when
        let total = sut.grandTotalCalculation(isTipInPercent: isTipInPercent)
        
        // then
        XCTAssertEqual(total, 125 , "The total amount should be calculate with precentage tip value")
    }
    
    func test_calculateGrandTotal_whenTipCash() {
        // given
        let isTipInPercent = false
        
        sut.checkAmount = 100
        sut.tipAmountinPercent = 25
        sut.tipAmountinCash = 75
        
        // when
        let total = sut.grandTotalCalculation(isTipInPercent: isTipInPercent)
        
        // then
        XCTAssertEqual(total, 175 , "The total amount should be calculate with cash tip value")
    }
    
    
// MARK: testing 'total' computed property
    
    func test_totalPerPerson() {
        // given
        sut.isTipInPercent = true
        sut.noOfPeople = 15
        sut.tipAmountinPercent = 30
        sut.checkAmount = 157.50
        
        //when
        let perPerson = sut.total.1
        
        // then
        XCTAssertEqual(perPerson, 13.65)
        
        
        
    }
}
