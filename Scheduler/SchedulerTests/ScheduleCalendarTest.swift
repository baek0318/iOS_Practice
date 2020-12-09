//
//  ScheduleCalendarTest.swift
//  SchedulerTests
//
//  Created by 백승화 on 2020/12/09.
//

import XCTest
@testable import Scheduler

class ScheduleCalendarTest: XCTestCase {
    
    var repository : ScheduleTableRepository?
    var calendarModel : ScheduleCalendarModelProtocol?

    override func setUpWithError() throws {
        repository = MemoryScheduleTableRepository()
        calendarModel = ScheduleCalendarModel()
    }

    override func tearDownWithError() throws {
        repository = nil
        calendarModel = nil
    }
    
    func testLoadData() {
        //given
        let calendar = ScheduleCalendar(year: 2020, month: 12, day: 7)
        let start = Time(hour: 7, minute: 20)
        let end = Time(hour: 10, minute: 20)
        let timer = ScheduleTimer(startTime: start, endTime: end, title: "공부하기")
        let scheduleTable = ScheduleTable(calendar: calendar, timer: timer)
        
        let testData : [ScheduleTimer] = [timer]
        repository?.save(scheduleTable: scheduleTable)
        
        //when
        let result = calendarModel?.loadData(calendar : calendar)
        
        //then
        XCTAssertEqual(result, testData, "데이터가 일치하지 않습니다")
    }
}
