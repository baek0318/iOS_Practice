//
//  Timer.swift
//  Scheduler
//
//  Created by 백승화 on 2020/12/07.
//

import Foundation

public class ScheduleTimer {
    
    private var start : Time
    
    private var end : Time
    
    private var scheduleTitle : String
    
    public var startTime : Time {
        get {
            return start
        }
        set {
            self.start = newValue
        }
    }
    
    public var endTime : Time {
        get {
            return end
        }
        set {
            self.end = newValue
        }
    }
    
    public var title : String {
        get {
            return scheduleTitle
        }
        set {
            self.scheduleTitle = newValue
        }
    }
    
    public init(){
        self.start = Time(hour: 0, minute: 0)
        self.end = Time(hour: 0, minute: 0)
        self.scheduleTitle = ""
    }
    
    public init(startTime : Time, endTime : Time, title : String){
        self.start = startTime
        self.end = endTime
        self.scheduleTitle = title
    }
    
    public convenience init(startTime : Time, endTime : Time) {
        self.init(startTime : startTime, endTime : endTime, title : "휴식")
    }
}

extension ScheduleTimer : Equatable {
    
    public static func == (lhs: ScheduleTimer, rhs: ScheduleTimer) -> Bool {
        return lhs.startTime == rhs.startTime && lhs.endTime == rhs.endTime && lhs.title == rhs.title
    }
    
}
