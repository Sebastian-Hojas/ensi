//
//  DateSchedulable.swift
//  Ensi
//
//  Created by Sebastian Hojas on 16/07/2017.
//  Copyright © 2017 Ensi. All rights reserved.
//

import Foundation

final class DateSchedulable: Schedulable {

    private var timer: Timer?
    var delay: TimeInterval = 0
    
    func stop() {
        timer?.invalidate()
    }
    
    func start(result: @escaping (DateSchedulable)->()) {
        timer = Timer(timeInterval: delay, repeats: false) { [weak self] (timer) in
            guard let schedulable = self else { return }
            result(schedulable)
        }
        timer?.fire()
    }

    static func ==(_ lhs: DateSchedulable, rhs: DateSchedulable) -> Bool {
        return lhs.timer == rhs.timer
    }
}
