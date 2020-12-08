//
//  ScheduleTable.swift
//  Scheduler
//
//  Created by 백승화 on 2020/12/07.
//

import Foundation

public class ScheduleTable {
    
    private var calendar : ScheduleCalendar
    
    private var timer : ScheduleTimer
    
    init(calendar : ScheduleCalendar, timer : ScheduleTimer) {
        self.calendar = calendar
        self.timer = timer
    }
    
    public func getCalendar() -> ScheduleCalendar {
        return calendar
    }
    
    public func getTimer() -> ScheduleTimer {
        return timer
    }
}

extension ScheduleTable : Equatable {
    public static func == (lhs: ScheduleTable, rhs: ScheduleTable) -> Bool {
        return lhs.calendar == rhs.calendar && lhs.timer == rhs.timer
    }
}
