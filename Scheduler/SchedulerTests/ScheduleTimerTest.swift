//
//  ScheduleTimerTest.swift
//  SchedulerTests
//
//  Created by 백승화 on 2020/12/07.
//

import XCTest
@testable import Scheduler

class ScheduleTimerTest: XCTestCase {
    
    var timerService : ScheduleTimerServiceProtocol?
    var repository : ScheduleTableRepository?

    override func setUpWithError() throws {
        timerService = ScheduleTimerService()
        repository = MemoryScheduleTableRepository()
    }

    override func tearDownWithError() throws {
        timerService = nil
        repository = nil
    }
    
    func testTimerExtendError() throws {
        //given
        let startTime = Time(hour: 9, minute: 20)
        let endTime = Time(hour: 10, minute: 50)
        
        let newEndTime = Time(hour: 10, minute: 40)
        
        //when
        timerService?.start(start: startTime, end: endTime)
        
        //then
        XCTAssertThrowsError(try timerService?.extend(time: newEndTime), "not occur error") { (error) in
            XCTAssertEqual(error as! ScheduleTimerError , ScheduleTimerError.shorterThanOrigin)
        }
    }
    
    func testTimerExtendPass() throws {
        //given
        let startTime = Time(hour: 9, minute: 20)
        let endTime = Time(hour: 10, minute: 50)
        
        let newEndTime = Time(hour: 10, minute: 51)
        
        //when
        timerService?.start(start: startTime, end: endTime)
        
        //then
        XCTAssertNoThrow(try timerService?.extend(time: newEndTime), "error occur")
    }
    
    func testTimerEndReturnData() throws {
        //given
        let calendar = ScheduleCalendar.makeCalendar()
        let startTime = Time(hour: 9, minute: 20)
        let endTime = Time(hour: 10, minute: 50)
        let timer = ScheduleTimer(startTime: startTime, endTime: endTime)
        
        //when
        timerService?.start(start: startTime, end: endTime)
        let result = timerService?.end(time: endTime)
        
        //then
        let scheduleTable = ScheduleTable(calendar: calendar, timer: timer)
        XCTAssertNotEqual(result, scheduleTable, "return data is not equal")
    }
    
    func testTimerReturnDataSaveNoError() throws {
        //given
        let calendar = ScheduleCalendar.makeCalendar()
        let startTime = Time(hour: 9, minute: 20)
        let endTime = Time(hour: 10, minute: 50)

        //when
        timerService?.start(start: startTime, end: endTime)
        let data = timerService?.end(time: endTime)
        
        timerService?.enroll(returnData: data!)
        
        //then
        XCTAssertNoThrow(try repository?.findByCalendar(scheduleCalendar: calendar), "error")
    }
    
    func testTimerReturnDataSave() throws {
        //given
        let calendar = ScheduleCalendar.makeCalendar()
        let startTime = Time(hour: 9, minute: 20)
        let endTime = Time(hour: 10, minute: 50)
        let timer = ScheduleTimer(startTime: startTime, endTime: endTime, title: "")

        //when
        timerService?.start(start: startTime, end: endTime)
        let data = timerService?.end(time: endTime)
        
        timerService?.enroll(returnData: data!)
        
        //then
        let result = try repository?.findByCalendar(scheduleCalendar: calendar)
        
        XCTAssertEqual(result, [timer], "")
    }
    
    func testTimerChangeTitle() throws {
        //given
        let startTime = Time(hour: 9, minute: 20)
        let endTime = Time(hour: 10, minute: 50)
        let timer = ScheduleTimer(startTime: startTime, endTime: endTime, title: "휴식")
        
        //when
        timerService?.changeTitle(title: "휴식")
        timerService?.start(start: startTime, end: endTime)
        let data = timerService?.end(time: endTime)
        
        //then
        XCTAssertEqual(data?.getTimer(), timer, "title is not change")
    }
}
