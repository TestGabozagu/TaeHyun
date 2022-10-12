//
//  StrangeCalculatorTests.swift
//  StrangeCalculatorTests
//
//  Created by 이태현 on 2022/10/07.
//

import XCTest
@testable import TDD_LottoMachine

final class StrangeCalculatorTests: XCTestCase {
    var sut: StrangeCalculator!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = StrangeCalculator()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_addString호출시_1_2_3을전달했을때_6을반환하는지() throws {
        //then
        XCTAssertEqual(try sut.addString(input: "1,2,3"), 6)
    }
    
    func test_addString호출시_nil을잘구별해서에러를보내는지() throws {
        //then
        XCTAssertThrowsError(try sut.addString(input: nil))
    }
    
    func test_addString호출시_음수는아닌지() throws {
        //then
        XCTAssertGreaterThan(try sut.addString(input: "1:4"), -1)
    }
    
    func test_addString호출시_비어있을때에러를보내는지() throws {
        //then
        XCTAssertThrowsError(try sut.addString(input: ""))
    }
    
    func test_addString호출시_쉼표와콜론을모두잘구별하는지() throws {
        //then
        XCTAssertEqual(try sut.addString(input: "1:2:3,4,-4:-3:-2"), 1)
    }
    
    func test_addString호출시_음수일때에러보내는지() throws {
        //then
        XCTAssertThrowsError(try sut.addString(input: "-1,-2:-3"))
    }
    
}


