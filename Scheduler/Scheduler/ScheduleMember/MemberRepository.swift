//
//  ScheduleMemberRepository.swift
//  Scheduler
//
//  Created by 백승화 on 2020/12/09.
//

import Foundation

protocol MemberRepository {
    
    func save(member : Member)
    
    func findByName(name : String) throws -> String
}
