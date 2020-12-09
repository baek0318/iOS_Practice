//
//  ScheduleMemberTest.swift
//  SchedulerTests
//
//  Created by 백승화 on 2020/12/09.
//

import XCTest
@testable import Scheduler

class ScheduleMemberTest: XCTestCase {
    
    var memberModel : MemberModel?
    var repository : MemberRepository?

    override func setUpWithError() throws {
        memberModel = MemberModelImpl()
        repository = MemoryMemberRepository()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        memberModel = nil
        repository = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testMemberJoin() {
        //given
        let name = "백승화"
        let member = Member(name: name)
        
        //when
        memberModel?.join(member: member)
        
        //then
        XCTAssertNoThrow(try repository?.findByName(name: name), "멤버 저장이 제대로 되지 않았습니다!!")
    }
}
