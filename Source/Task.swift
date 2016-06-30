//
//  Task.swift
//  Starbird
//
//  Created by Michał Tynior on 30/06/16.
//  Copyright © 2016 Michal Tynior. All rights reserved.
//

import Foundation

public class Task: TaskType {
    
    public var name: String = ""
    
    public var executionBlock: TaskExecutionBlock?
    
    public init(name: String, executionBlock: TaskExecutionBlock?) {
        self.name = name
        self.executionBlock = executionBlock
    }
    
    public func execute(with parameters: [String: Any]?) {
        executionBlock?(parameters)
    }
    
}
