//
//  ScheduleCalendarModel.swift
//  Scheduler
//
//  Created by 백승화 on 2020/12/08.
//

import Foundation

class ScheduleCalendarModel : ScheduleCalendarModelProtocol {
    
    private let repository : ScheduleTableRepository = MemoryScheduleTableRepository()
    private let scheduleCalendar = ScheduleCalendar()
    
    func selectDay(day : Int) {
        scheduleCalendar.day = day
    }
    
    func selectMonth(month : Int) {
        scheduleCalendar.month = month
    }
    
    func selectYear(year : Int) {
        scheduleCalendar.year = year
    }

    func loadData(calendar : ScheduleCalendar) -> [ScheduleTimer] {
        var datas : [ScheduleTimer]
        
        do {
            datas = try repository.findByCalendar(scheduleCalendar: calendar)
        } catch {
            print(error)
            return []
        }
        
        return datas
    }
}
