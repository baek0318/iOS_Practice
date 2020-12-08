//
//  MemoryScheduleTalbeRepository.swift
//  Scheduler
//
//  Created by 백승화 on 2020/12/07.
//

import Foundation

public class MemoryScheduleTableRepository : ScheduleTableRepository {
    
    private static var repository : [ScheduleCalendar : [ScheduleTimer]] = Dictionary()
    
    /// 저장소에 객체를 저장하고자 할때 사용하면 되는 메서드
    /// - Parameter scheduleTable: 저장하고자 하는 ScheduleTable 데이터이다
    public func save(scheduleTable: ScheduleTable) {
        let calendarData = scheduleTable.getCalendar()
        let timerData = scheduleTable.getTimer()
        
        if MemoryScheduleTableRepository.repository[calendarData] == nil {
            MemoryScheduleTableRepository.repository[calendarData] = [timerData]
        }
        else {
            MemoryScheduleTableRepository.repository[calendarData]?.append(timerData)
        }
    }
    
    /// 저장소에서 년 월 일로 데이터를 찾을 때 사용하면 되는 메서드
    /// - Parameter scheduleCalendar: 찾고자 하는 ScheduleCalendar 데이터이다
    /// - Returns: ScheduleCalendar 데이터를 통해 찾은 [ScheduleTimer] 배열 데이터이다
    public func findByCalendar(scheduleCalendar : ScheduleCalendar) throws -> [ScheduleTimer] {
        
        guard let timerData = MemoryScheduleTableRepository.repository[scheduleCalendar] else {
            throw ScheduleTableError.dataNotFound
        }

        return timerData
    }
}
