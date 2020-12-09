//
//  Member.swift
//  Scheduler
//
//  Created by 백승화 on 2020/12/08.
//

import Foundation

public class Member {

    private var _name : String
    
    public var name : String {
        get {
            return _name
        }
        set {
            self._name = newValue
        }
    }
    
    public init(name : String) {
        self._name = name
    }
}

extension Member : Hashable {
    public static func == (lhs: Member, rhs: Member) -> Bool {
        return  lhs._name == rhs._name
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(_name)
    }
}
