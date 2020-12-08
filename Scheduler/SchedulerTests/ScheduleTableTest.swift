//
//  ScheduleTableTest.swift
//  SchedulerTests
//
//  Created by 백승화 on 2020/12/07.
//

import XCTest
@testable import Scheduler

class ScheduleTableTest: XCTestCase {
    
    var repository : ScheduleTableRepository?
    
    override func setUpWithError() throws {
        repository = MemoryScheduleTableRepository()
        
    }

    override func tearDownWithError() throws {
        repository = nil
        
    }

    func testRightToSave() throws {
        //given
        let calendar = ScheduleCalendar(year: 2020, month: 12, day: 7)
        let start = Time(hour: 7, minute: 20)
        let end = Time(hour: 10, minute: 20)
        let timer = ScheduleTimer(startTime: start, endTime: end, title: "공부하기")
        let scheduleTable = ScheduleTable(calendar: calendar, timer: timer)
        
        let testData : [ScheduleTimer] = [timer]
        
        //when
        repository?.save(scheduleTable: scheduleTable)
        
        //then
        let result = try repository?.findByCalendar(scheduleCalendar: calendar)
        
        XCTAssertEqual(testData, result, "uncorrect")
    }
    
    
}
