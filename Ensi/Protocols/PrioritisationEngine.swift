//
//  PrioritisationEngine.swift
//  Ensi
//
//  Created by Sebastian Hojas on 13/07/2017.
//  Copyright © 2017 Ensi. All rights reserved.
//

import Foundation

protocol PrioritisationEngine {
    
    associatedtype Value: Schedulable
    
    var activeQueueSize: Int { get }

    func take(_ lhs: Value, before rhs: Value) -> Bool
    func abort(lhs: Value, for rhs: Value) -> Bool
}
