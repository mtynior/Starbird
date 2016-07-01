//
//  TaskScheduler.swift
//  Starbird
//
//  Created by Michal Tynior on 01/07/2016.
//  Copyright © 2016 Michal Tynior. All rights reserved.
//

import Foundation

public class TaskScheduler {
    
    private var _queue: OperationQueue = OperationQueue()
    
    var operations: [Operation] = []

    
    public func addTask(_ task: Task) {
        
        operations.append(task)
        
        addSubTask(task)
        
        _queue.addOperations(operations, waitUntilFinished: true)
    }
    
    private func addSubTask(_ task: Task) {
        if let nextTask = task.nextTask {
            operations.append(nextTask)
            
            addSubTask(nextTask)
        }
    }
}
