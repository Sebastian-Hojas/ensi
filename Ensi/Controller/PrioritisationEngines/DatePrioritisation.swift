//
//  DatePrioritisation.swift
//  Ensi
//
//  Created by Sebastian Hojas on 13/07/2017.
//  Copyright © 2017 Ensi. All rights reserved.
//

import Foundation


struct DatePrioritisation<T: Schedulable>: PrioritisationEngine {
    
    var activeQueueSize: Int { return 4 }
    
    func take(_ lhs: T, before rhs: T) -> Bool {
        return false
    }

    func abort(lhs: T, for rhs: T) -> Bool {
        return false
    }
    
}
