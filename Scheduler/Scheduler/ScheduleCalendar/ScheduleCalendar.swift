//
//  ScheduleCalendar.swift
//  Scheduler
//
//  Created by 백승화 on 2020/12/07.
//

import Foundation

public class ScheduleCalendar {
    
    private var year : Int
    private var month : Int
    private var day : Int
    
    public init(year : Int, month : Int, day : Int) {
        self.year = year
        self.month = month
        self.day = day
    }
    
    public static func makeCalendar() -> ScheduleCalendar {
        let date = Date(timeIntervalSinceNow: 0)
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        let year = components.year!
        let month = components.month!
        let day = components.day!
        
        return ScheduleCalendar(year: year, month: month, day: day)
    }
}

extension ScheduleCalendar : Hashable {
    
    public static func == (lhs: ScheduleCalendar, rhs: ScheduleCalendar) -> Bool {
        return lhs.year == rhs.year && lhs.month == rhs.month && lhs.day == rhs.day
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(year)
        hasher.combine(month)
        hasher.combine(day)
    }
}
