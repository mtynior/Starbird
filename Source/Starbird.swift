//
//  Starbird.swift
//  Starbird
//
//  Created by Michał Tynior on 30/06/16.
//  Copyright © 2016 Michal Tynior. All rights reserved.
//

import Foundation

public class Starbird {
    
    private var _tasks: [String : StarbirdTask] = [:]

    public func addTask(named name: String, execute: StarbirdTaskExecutionBlock) {
        
        guard !isTaskDefined(taskName: name) else {
            print("[Error] Task `\(name)` is alredy defined")
            return
        }
        
        let task = StarbirdTask(name: name, executionBlock: execute)
        _tasks[name] = task
    }

}

// MARK: - Start task

extension Starbird {
    
    public func startTask(named name: String) {
    
        guard isTaskDefined(taskName: name) else {
            print("[Error] Task `\(name)` is not defined")
            return
        }
        
        startTask(named: name, beforeExecute: nil)
    }
    
    public func startTask(named name: String, beforeExecute preTask: ( (Void) -> Void )? ) {
        startTask(named: name, beforeExecute: preTask, afterExecute: nil)
    }
    
    public func startTask(named name: String, afterExecute postTask: ( (Void) -> Void )? ) {
        startTask(named: name, beforeExecute: nil, afterExecute: postTask)
    }
    
    public func startTask(named name: String, beforeExecute preTaskBlock: ( (Void) -> Void )?, afterExecute postTaskBlock: ( (Void) -> Void )?) {
    
        guard isTaskDefined(taskName: name) else {
            print("[Error] Task `\(name)` is not defined")
            return
        }
        
        let preTask = BlockTask() {
            preTaskBlock?()
            return nil
        }
        
        let task = BlockTask { [weak self] in
            self?._tasks[name]?.execute()
            return nil
        }
        
        let postTask = BlockTask() {
            postTaskBlock?()
            return nil
        }
        
        preTask.continue(with: task)
        task.continue(with: postTask)
        
        preTask.execute()
    }
    
    public func startTask(named name: String, afterExecute postTasks: [String]) {}
    
    public func startTask(named name: String, beforeExecute preTasks: [String]) {}
   
    public func startTask(named name: String, beforeExecute preTasks: [String], afterExecute postTasks: [String] ) {}

    public func startTask(named name: String, beforeExecute preTasks: [String], afterExecute task: ( (Void) -> Void )?) {}

    public func startTask(named name: String, beforeExecute preTasks: ( (Void) -> Void )?, afterExecute postTasks: [String]) {}
    
}

// MARK: - Helpers

extension Starbird {
    
    private func isTaskDefined(taskName: String) -> Bool {
        return _tasks[taskName] != nil
    }
    
}
