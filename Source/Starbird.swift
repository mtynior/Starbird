//
//  Starbird.swift
//  Starbird
//
//  Created by Michał Tynior on 30/06/16.
//  Copyright © 2016 Michal Tynior. All rights reserved.
//

import Foundation

public class Starbird {

    private var _tasks: [String :  TaskType] = [:]
    
    public func task(name: String, executionBlock: TaskExecutionBlock) {
        let task = Task(name: name, executionBlock: executionBlock)
        
        addTask(task)
    }
    
    public func execute(taskName: String, parameters: [String : Any]? = nil) {
        guard let task = _tasks[taskName] else {
            print("[Error] Task with `\(taskName)` is not defined")
            return
        }
        
        task.execute(with: parameters)
    }
    
}

// MARK: - Helpers

extension Starbird {
    
    private func addTask(_ task: TaskType) {
        
        guard !task.name.isEmpty else {
            print("[Error] Task name is not empty!")
            return
        }
        
        guard _tasks[task.name] == nil else {
            print("[Error] Task with `\(task.name)` name is already defined!")
            return
        }
        
        _tasks[task.name] = task
    }
    
}
