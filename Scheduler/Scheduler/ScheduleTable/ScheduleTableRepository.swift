//
//  ScheduleTableRepository.swift
//  Scheduler
//
//  Created by 백승화 on 2020/12/07.
//

import Foundation

protocol ScheduleTableRepository {
    
    /// 저장소에 객체를 저장하고자 할때 사용하면 되는 메서드
    /// - Parameter scheduleTable: 저장하고자 하는 ScheduleTable 데이터이다
    func save(scheduleTable : ScheduleTable)
    
    /// 저장소에서 년 월 일로 데이터를 찾을 때 사용하면 되는 메서드
    /// - Parameter scheduleCalendar: 찾고자 하는 ScheduleCalendar 데이터이다
    func findByCalendar(scheduleCalendar : ScheduleCalendar) throws -> [ScheduleTimer]
    
}
