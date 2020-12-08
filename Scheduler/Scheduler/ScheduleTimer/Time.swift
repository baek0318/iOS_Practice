//
//  Time.swift
//  Scheduler
//
//  Created by 백승화 on 2020/12/07.
//

import Foundation

public class Time {
    
    private var _hour : Int
    
    private var _minute : Int
    
    public var hour : Int {
        get {
            return _hour
        }
        set {
            self._hour = newValue
        }
    }
    
    public var minute : Int {
        get {
            return _minute
        }
        set {
            self._minute = newValue
        }
    }
    
    public init(hour : Int, minute : Int) {
        self._hour = hour
        self._minute = minute
    }
}

extension Time : Equatable {
    
    public static func == (lhs: Time, rhs: Time) -> Bool {
        return lhs.hour == rhs.hour && lhs.minute == rhs.minute
    }
    
}
