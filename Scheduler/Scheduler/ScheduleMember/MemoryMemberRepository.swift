//
//  MemoryScheduleMemberRepository.swift
//  Scheduler
//
//  Created by 백승화 on 2020/12/09.
//

import Foundation

class MemoryMemberRepository : MemberRepository {
    
    private let repository = UserDefaults.standard
    
    func save(member: Member) {
        
        let name = member.name
       
        repository.set(name, forKey: "name")
    }
    
    func findByName(name : String) throws -> String {
        
        guard let member = repository.string(forKey: "name") else {
            throw MemberError.noMember
        }
        
        return member
    }
   
}
