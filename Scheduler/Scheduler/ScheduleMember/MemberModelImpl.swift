//
//  MemberModelImpl.swift
//  Scheduler
//
//  Created by 백승화 on 2020/12/09.
//

import Foundation

public class MemberModelImpl : MemberModel {
    
    private let scheduleRepository : MemberRepository = MemoryMemberRepository()
    
    public func join(member: Member) {
        scheduleRepository.save(member: member)
    }

}
