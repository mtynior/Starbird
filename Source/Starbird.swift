//
//  Starbird.swift
//  Starbird
//
//  Created by Michał Tynior on 30/06/16.
//  Copyright © 2016 Michal Tynior. All rights reserved.
//

import Foundation

public class Starbird {

    public func addTask(named name: String, execute: StarbirdTaskExecutionBlock) {
        
    }

}

// Mark: - Start task

extension Starbird {
    
    public func startTask(named name: String) { }
    
    public func startTask(named name: String, beforeExecute preTask: ( (Void) -> Void )? ) { }
    
    public func startTask(named name: String, beforeExecute preTasks: [String]) {}

    public func startTask(named name: String, afterExecute postTask: ( (Void) -> Void )? ) { }
    
    public func startTask(named name: String, afterExecute postTasks: [String]) {}

    public func startTask(named name: String, beforeExecute preTasks: ( (Void) -> Void )?, afterExecute postTask: ( (Void) -> Void )?) {}
   
    public func startTask(named name: String, beforeExecute preTasks: [String], afterExecute postTasks: [String] ) {}

    public func startTask(named name: String, beforeExecute preTasks: [String], afterExecute task: ( (Void) -> Void )?) {}

    public func startTask(named name: String, beforeExecute preTasks: ( (Void) -> Void )?, afterExecute postTasks: [String]) {}
    
}
