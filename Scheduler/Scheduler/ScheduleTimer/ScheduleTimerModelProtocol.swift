//
//  Timer.swift
//  Scheduler
//
//  Created by 백승화 on 2020/12/07.
//

import Foundation

protocol ScheduleTimerServiceProtocol {
    
    /// 시작버튼을 눌렀을때에 불려지는 메서드
    /// - Parameters:
    ///   - start: 시작시간을 넘겨준다
    ///   - end: 지정한 끝나는 시간을 넘겨준다
    func start(start: Time, end: Time)
    
    /// timer의 끝냄 버튼을 눌렀거나 제한시간이 다된경우 불리는 메서드
    /// - Parameter time: 끝냄 버튼을 누른 시점의 시간이 넘겨진다
    func end(time : Time) -> ScheduleTable
    
    /// 끝나는 시점을 연장시킬 수 있는 메서드
    /// - Parameter time: 연장시킬 시간을 넘겨주면 된다
    func extend(time : Time) throws
    
    /// 지금 타이머의 주제를 바꿀 수 있는 메서드
    /// - Parameter title: 바꾸고 싶은 문자열을 입력하면 된다
    func changeTitle(title : String)
    
    /// 끝난 스케줄을 저장소에 저장해주는 메서드이다
    /// - Parameter returnData: 저장할 데이터를 넘겨줄 매개변수이다
    func enroll(returnData : ScheduleTable)
    
}
