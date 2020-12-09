//
//  ScheduleCalendar.swift
//  Scheduler
//
//  Created by 백승화 on 2020/12/07.
//

import Foundation

public class ScheduleCalendar {
    
    private var _year : Int
    private var _month : Int
    private var _day : Int
    
    public var year : Int {
        get {
            return _year
        }
        set {
            self._year = newValue
        }
    }
    
    public var month : Int {
        get {
            return _month
        }
        set {
            self._month = newValue
        }
    }
    
    public var day : Int {
        get {
            return _day
        }
        set {
            self._day = newValue
        }
    }
    
    public init(){
        self._year = 0
        self._month = 0
        self._day = 0
    }
    
    public init(year : Int, month : Int, day : Int) {
        self._year = year
        self._month = month
        self._day = day
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
        return lhs._year == rhs._year && lhs._month == rhs._month && lhs._day == rhs._day
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(_year)
        hasher.combine(_month)
        hasher.combine(_day)
    }
}
