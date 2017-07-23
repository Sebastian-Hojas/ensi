//
//  Scheduler.swift
//  Ensi
//
//  Created by Sebastian Hojas on 13/07/2017.
//  Copyright © 2017 Ensi. All rights reserved.
//

import Foundation

class Scheduler<Comparator: PrioritisationEngine> {
    
    var schedulablesActive = Queue<Comparator.Value>()
    var schedulablesWaiting = Queue<Comparator.Value>()

    var comparator: Comparator
    
    init(comparator: Comparator) {
        self.comparator = comparator
    }
    
    func schedule(_ value: Comparator.Value) {
        schedulablesWaiting.enqueue(value, engine: comparator)
        tick()
    }
    
    func tick() {
        guard let waiting = schedulablesWaiting.first else {
            return
        }
        if let lowestPriorityActive = schedulablesActive.first,
            comparator.abort(lhs: lowestPriorityActive, for: waiting) {
            lowestPriorityActive.stop()
            start(task: waiting)
        }
        else if comparator.activeQueueSize > schedulablesActive.count {
            start(task: waiting)
        }
    }
    
    private func start(task: Comparator.Value) {
        task.start { [weak self] _ in
            self?.tick()
        }
    }
    
    
    
    
}
