//
//  Starbird.swift
//  Starbird
//
//  Created by Michał Tynior on 30/06/16.
//  Copyright © 2016 Michal Tynior. All rights reserved.
//

import Foundation

public class Starbird {

    private var _tasks: [String :  StarbirdTaskType] = [:]
    
    public func task(name: String, executionBlock: StarbirdTaskExecutionBlock) {
        let task = StarbirdTask(name: name, executionBlock: executionBlock)
        
        addStarbirdTask(task)
    }
    
    
    public func task(name: String, tasks: [String]) {
        
    }
    
    public func execute(taskName: String, parameters: [String : Any]? = nil) {
        guard let task = _tasks[taskName] else {
            print("[Error] StarbirdTask with `\(taskName)` is not defined")
            return
        }
        
        task.execute(with: parameters)
    }
    
}

// MARK: - Helpers

extension Starbird {
    
    private func addStarbirdTask(_ task: StarbirdTaskType) {
        
        guard !task.name.isEmpty else {
            print("[Error] StarbirdTask name is not empty!")
            return
        }
        
        guard _tasks[task.name] == nil else {
            print("[Error] StarbirdTask with `\(task.name)` name is already defined!")
            return
        }
        
        _tasks[task.name] = task
    }
    
}
