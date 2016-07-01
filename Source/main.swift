//
//  main.swift
//  Starbird
//
//  Created by Michal Tynior on 30/06/2016.
//  Copyright © 2016 Michal Tynior. All rights reserved.
//

import Foundation

print("Hello from Starbird")

let starbird = Starbird()

starbird.addTask(named: "task1") { _ in
    print("Executing task 1")
}

starbird.addTask(named: "task2") { _ in
    print("Executing task 2")
}

// execute

starbird.startTask(named: "task1")

starbird.startTask(named: "task1", beforeExecute: { _ in
    print("Task 1 haven't started yet")
})

starbird.startTask(named: "task1", beforeExecute: ["task2"] )

starbird.startTask(named: "task1", afterExecute: { _ in
    print("Task 1 completed")
})

starbird.startTask(named: "task1", afterExecute: ["test2"])

starbird.startTask(named: "task1", beforeExecute: { _ in
    print("Task 1 haven't started yet")
}, afterExecute: { _ in
    print("Task 1 completed")
})

starbird.startTask(named: "task1", beforeExecute:  ["task2"], afterExecute: ["task2"])

starbird.startTask(named: "task1", beforeExecute: { _ in
    print("Task 1 haven't started yet")
}, afterExecute: ["task2"])

starbird.startTask(named: "task1", beforeExecute:  ["task2"], afterExecute: { _ in
    print("Task 1 completed")
})
