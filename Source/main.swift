//
//  main.swift
//  Starbird
//
//  Created by Michal Tynior on 30/06/2016.
//  Copyright © 2016 Michal Tynior. All rights reserved.
//

import Foundation

let starbird = Starbird()

starbird.task(name: "task1") { _ in
    print("Executing Task 1")
}

starbird.task(name: "task2") { params in
    print("Executing Task 2 with parameters: \(params)")
}

starbird.execute(taskName: "task1")

starbird.execute(taskName: "task2", parameters: ["param1" : 1, "param2" : "param2" ])
