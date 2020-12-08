//
//  Member.swift
//  Scheduler
//
//  Created by 백승화 on 2020/12/08.
//

import Foundation

class Member {
    
    private var id : Int64
    
    private var name : String
    
    init(id : Int64, name : String) {
        self.id = id
        self.name = name
    }
}

extension Member : Hashable {
    static func == (lhs: Member, rhs: Member) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
    }
}
