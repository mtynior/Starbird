//
//  main.swift
//  Starbird
//
//  Created by Michal Tynior on 30/06/2016.
//  Copyright © 2016 Michal Tynior. All rights reserved.
//

import Foundation


let task1 = BlockTask() {
    print("Executing task 1")
    return TaskResult()
}

let task2 = BlockTask() {
    print("Executing task 2")
    return nil
}

let task3 = BlockTask() {
    print("Executing task 3")
    return nil
}


task1.continue(with: task2)
task2.continue(with: task3)
task1.execute()


print("Executing main thread")
