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
            UI.showError("Task `\(name)` is alredy defined")
            return
        }
        
        let task = StarbirdTask(name: name, executionBlock: execute)
        _tasks[name] = task
    }

}

// MARK: - Start task

extension Starbird {
    
    public func startTask(named name: String) {
        startTask(named: name, beforeExecute: nil)
    }
    
    public func startTask(named name: String, beforeExecute preTaskBlock: StarbirdTaskExecutionBlock? ) {
        startTask(named: name, beforeExecute: preTaskBlock, afterExecute: nil)
    }
    
    public func startTask(named name: String, afterExecute postTaskBlock: StarbirdTaskExecutionBlock? ) {
        startTask(named: name, beforeExecute: nil, afterExecute: postTaskBlock)
    }
    
    public func startTask(named name: String, beforeExecute preTaskBlock: StarbirdTaskExecutionBlock?, afterExecute postTaskBlock: StarbirdTaskExecutionBlock?) {
        
        do {
            var preTasksList: [Task] = []
            
            if let preTaskBlock = preTaskBlock {
                let preTask = spawnTaskFromBlock(preTaskBlock)
                preTasksList.append(preTask)
            }
            
            let currentTask = try spawnTask(named: name)
            
            var postTasksList: [Task] = []

            if let postTaskBlock = postTaskBlock {
                let postTask = spawnTaskFromBlock(postTaskBlock)
                postTasksList.append(postTask)
            }
            
            extecuteTask(currentTask, preTasks: preTasksList, postTasks: postTasksList)
            
        } catch let error {
            UI.showError(error)
        }

    }
    
    public func startTask(named name: String, beforeExecute preTasks: [String]) {
        startTask(named: name, beforeExecute: preTasks, afterExecute: [])
    }

    public func startTask(named name: String, afterExecute postTasks: [String]) {
        startTask(named: name, beforeExecute: [], afterExecute: postTasks)
    }
    
    public func startTask(named name: String, beforeExecute preTasks: [String], afterExecute postTasks: [String] ) {
    
        do {
            
            let preTasksList = try spawnTasks(named: preTasks)
            
            let currentTask = try spawnTask(named: name)
            
            let postTasksList =  try spawnTasks(named: postTasks)
            
            extecuteTask(currentTask, preTasks: preTasksList, postTasks: postTasksList)
            
        } catch let error {
            UI.showError(error)
        }

    }

    public func startTask(named name: String, beforeExecute preTasks: [String], afterExecute postTaskBlock: StarbirdTaskExecutionBlock) {
    
        do {
            
            let preTasksList = try spawnTasks(named: preTasks)
            
            let currentTask = try spawnTask(named: name)
            
            let postTask = spawnTaskFromBlock(postTaskBlock)
            
            let postTasksList: [Task] = [postTask]
            
            extecuteTask(currentTask, preTasks: preTasksList, postTasks: postTasksList)
            
        } catch let error {
            UI.showError(error)
        }

    }

    public func startTask(named name: String, beforeExecute preTaskBlock: StarbirdTaskExecutionBlock, afterExecute postTasks: [String]) {
    
        do {
            let preTask = spawnTaskFromBlock(preTaskBlock)
            
            let preTasksList = [preTask]
           
            let currentTask = try spawnTask(named: name)
            
            let postTasksList = try spawnTasks(named: postTasks)
            
            extecuteTask(currentTask, preTasks: preTasksList, postTasks: postTasksList)
            
        } catch let error {
            UI.showError(error)
        }
        
    }
    
}

// MARK: - Helpers

extension Starbird {
    
    private func isTaskDefined(taskName: String) -> Bool {
        return _tasks[taskName] != nil
    }
    
    private func spawnTask(named name: String) throws -> Task {
        
        guard isTaskDefined(taskName: name) else {
            throw StarbirdError.TaskNotFound(name: name)
        }
        
        let task = BlockTask { [weak self] in
            self?._tasks[name]?.execute()
            return nil
        }

        return task
    }
    
    private func spawnTasks(named names: [String]) throws -> [Task] {
        return try names.map({ name in return try spawnTask(named: name) })
    }
    
    private func spawnTaskFromBlock(_ executionBlock: StarbirdTaskExecutionBlock) -> Task {
        let task = BlockTask() {
            executionBlock()
            return nil
        }
        
        return task
    }
    
    private func extecuteTask(_ currentTask: Task, preTasks: [Task], postTasks: [Task]) {
        
        if preTasks.count > 0 {
            let preTasksScheduler = TaskScheduler()
                
            preTasksScheduler.addParallelTasks(preTasks)
            preTasksScheduler.startExecuting(waitUntilAllTaskFinished: true)
        }
        
        currentTask.execute()
            
        if postTasks.count > 0 {
            let postTasksScheduler = TaskScheduler()
                
            postTasksScheduler.addParallelTasks(postTasks)
            postTasksScheduler.startExecuting(waitUntilAllTaskFinished: true)
        }
        
    }
    
}
