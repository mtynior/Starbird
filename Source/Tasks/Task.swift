//
//  Task.swift
//  Starbird
//
//  Created by Michal Tynior on 01/07/2016.
//  Copyright © 2016 Michal Tynior. All rights reserved.
//

import Foundation


public class Task: Operation {
    
    private var _isExecuting = false
    
    private var _isFinished = false
    
    public var result: TaskResult?
    
    public weak var previousTask: Task?
    
    public weak var nextTask: Task?
    
    override public var isExecuting: Bool {
        return _isExecuting
    }
    
    override public var isFinished: Bool {
        return _isFinished
    }
    

    public func execute(scheduler: TaskScheduler = TaskScheduler()) {
        scheduler.addTask(self)
        scheduler.startExecuting()
    }
    
    override public func start() {
        if isCancelled {
            finish()
            return
        }
        
        willChangeValue(forKey: "isExecuting")
        _isExecuting = true
        didChangeValue(forKey: "isExecuting")
        
        // Call main, maybe other subclasses will want use it?
        // We have to call it manually when overriding `start`.
        main()
    }
    
    override public func main() {
        if isCancelled == true && _isFinished != false {
            finish()
            return
        }
    }
    
    override public func cancel() {
        super.cancel()
        finish()
    }
    
    func finish() {
        willChangeValue(forKey: "isExecuting")
        willChangeValue(forKey: "isFinished")
        _isExecuting = false
        _isFinished = true
        didChangeValue(forKey: "isExecuting")
        didChangeValue(forKey: "isFinished")
    }

    public func `continue`(with task: Task) {
        nextTask = task
        nextTask?.previousTask = self
        nextTask?.addDependency(self)
    }
    
}
