//
//  ScheduleTimerService.swift
//  Scheduler
//
//  Created by 백승화 on 2020/12/07.
//

import Foundation

public class ScheduleTimerService : ScheduleTimerServiceProtocol {
    
    private let repository = MemoryScheduleTableRepository()
    private let scheduleTimer = ScheduleTimer()
    
    public func start(start : Time, end: Time) {
        scheduleTimer.startTime = start
        scheduleTimer.endTime = end
    }
    
    public func end(time: Time) -> ScheduleTable {
        scheduleTimer.endTime = time
        
        let calendar = ScheduleCalendar.makeCalendar()
        
        return ScheduleTable(calendar: calendar, timer: scheduleTimer)
    }
    
    public func extend(time : Time) throws {
        
        if time.hour < scheduleTimer.endTime.hour {
            throw ScheduleTimerError.shorterThanOrigin
        }
        if time.hour == scheduleTimer.endTime.hour && time.minute <= scheduleTimer.endTime.minute {
            throw ScheduleTimerError.shorterThanOrigin
        }
        
        scheduleTimer.endTime = time
    }
    
    public func changeTitle(title: String) {
        scheduleTimer.title = title
    }
    
    public func enroll(returnData: ScheduleTable) {
        repository.save(scheduleTable: returnData)
    }
    
}
