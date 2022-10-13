//
//  TDD_LottoMachineTests.swift
//  TDD_LottoMachineTests
//
//  Created by 김승찬 on 2022/10/03.
//

import XCTest
@testable import TDD_LottoMachine

class TDD_LottoMachineTests: XCTestCase {
    var sut: LottoMachine!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = LottoMachine()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        sut = nil
    }

    func test_중복되는수확인가능한지() throws {
        XCTAssertTrue(sut.isValidLottoNumber(of: [1,2,3,4,5,6]))
    }
    
    func test_1000원미만이면에러를던질까요() throws {
        XCTAssertThrowsError(try sut.buyLotto(999))
    }
    
    func test_구입가능갯수를맞출수있을지() throws {
        XCTAssertEqual(try sut.buyLotto(1000), 1)
    }
    
    func test_3개미만이면승자가이니니에러를던질까() throws {
        XCTAssertThrowsError(try sut.winStatistics(user: [1,2,3,4,5,6], winner: [6,7,8,9,10,11]))
    }
    
    func test_1000단위로안떨어지면에러를잘던질까() throws {
        XCTAssertThrowsError(try sut.buyLotto(1234))
    }
    
}
