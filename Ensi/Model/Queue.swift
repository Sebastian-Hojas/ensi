//
//  Queue.swift
//  Ensi
//
//  Created by Sebastian Hojas on 13/07/2017.
//  Copyright © 2017 Ensi. All rights reserved.
//

import Foundation

class Queue<Value: Schedulable> {
    
    var queue: [Value] = []
    
    func enqueue<T: PrioritisationEngine>(_ schedulable: Value, engine: T)
        where Value == T.Value {
        queue.append(schedulable)
        queue = queue.sorted(by: engine.take)
    }
    
    func dequeue() -> Value? {
        return queue.popLast()
    }
    
    func remove(_ schedulable: Value) {
        if let index = queue.index(of: schedulable) {
            queue.remove(at: index)
        }
    }
    
    var first: Value? {
        return queue.first
    }
    
    var last: Value? {
        return queue.last
    }
    
    var count: Int {
        return queue.count
    }
}
