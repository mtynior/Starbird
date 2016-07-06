//
//  Starbird.swift
//  Starbird
//
//  Created by Michał Tynior on 30/06/16.
//  Copyright © 2016 Michal Tynior. All rights reserved.
//

import Foundation

public typealias StarbirdTaskExecutionBlock = ( (Pipeline) -> Pipeline )

public class Starbird {
    
    private var _tasks: [String : StarbirdTaskExecutionBlock] = [:]

    public func addTask(named name: String, execute: StarbirdTaskExecutionBlock) {
        
        guard !isTaskDefined(taskName: name) else {
            UI.showError("Task `\(name)` is alredy defined")
            return
        }
        
        _tasks[name] = execute
    }

}

// MARK: - Start task

extension Starbird {
    
    public func startTask(named name: String) {
        startTask(named: name, beforeExecute: nil, afterExecute: nil)
    }
    
    public func startTask(named name: String, beforeExecute preTaskBlock: StarbirdTaskExecutionBlock? ) {
        startTask(named: name, beforeExecute: preTaskBlock, afterExecute: nil)
    }
    
    public func startTask(named name: String, afterExecute postTaskBlock: StarbirdTaskExecutionBlock? ) {
        startTask(named: name, beforeExecute: nil, afterExecute: postTaskBlock)
    }
    
    public func startTask(named name: String, beforeExecute preTaskBlock: StarbirdTaskExecutionBlock?, afterExecute postTaskBlock: StarbirdTaskExecutionBlock?) {
        
        guard isTaskDefined(taskName: name) else {
            UI.showError("Task `\(name)` is not defined")
            return
        }
        
        var pipeline = Pipeline()
        
        if let preBlock = preTaskBlock {
            pipeline = preBlock(pipeline)
        }
        
        if let currentPipeline = _tasks[name]?(pipeline) {
            pipeline = currentPipeline
        }
        
        if let postBlock = postTaskBlock {
            pipeline = postBlock(pipeline)
        }
        
        pipeline.run()
    }
    
}

// MARK: - Helpers

extension Starbird {
    
    private func isTaskDefined(taskName: String) -> Bool {
        return _tasks[taskName] != nil
    }
    
}
