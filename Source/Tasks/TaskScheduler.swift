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
    
    public init() {
        _queue.isSuspended = true
    }
    
    public func addTask(_ task: Task) {
        
        operations.append(task)
        
        addSubTask(task)
        
        _queue.addOperations(operations, waitUntilFinished: false)
    }
    
    public func addParallelTasks(_ tasks: [Task]) {
        _queue.maxConcurrentOperationCount = tasks.count
        _queue.addOperations(tasks, waitUntilFinished: false)
    }
    
    public func startExecuting() {
        _queue.isSuspended = false
        _queue.waitUntilAllOperationsAreFinished()
    }
    
    private func addSubTask(_ task: Task) {
        if let nextTask = task.nextTask {
            operations.append(nextTask)
            
            addSubTask(nextTask)
        }
    }
    
}
