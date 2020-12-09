//
//  ScheduleCalendarModelProtocol.swift
//  Scheduler
//
//  Created by 백승화 on 2020/12/08.
//

import Foundation

protocol ScheduleCalendarModelProtocol {
    
    /// 달력에서 날짜를 선택했을 경우 불리는 메서드
    /// - Parameter day: 선택한 날짜
    func selectDay(day : Int)
    
    /// 달력에서 달을 선택했을 경우 불리는 메서드
    /// - Parameter month: 선택한 달
    func selectMonth(month : Int)
    
    /// 달력에서 년을 선택했을 경우 불리는 메서드
    /// - Parameter year: 선택한 년
    func selectYear(year : Int)
    
    /// 년 월 일을 선택한 다음에 데이터를 SchedulTableRepository에서 불러오기 위한 메서드
    /// - Parameter calendar: 해당하는 년 월 일
    func loadData(calendar : ScheduleCalendar) -> [ScheduleTimer]
}
