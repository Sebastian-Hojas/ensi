//
//  Schedulable.swift
//  Ensi
//
//  Created by Sebastian Hojas on 13/07/2017.
//  Copyright © 2017 Ensi. All rights reserved.
//

import Foundation

protocol Schedulable: Equatable {
    func stop()
    func start(result: @escaping (Self)->())
}
