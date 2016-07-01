//
//  StarbirdTask.swift
//  Starbird
//
//  Created by Michał Tynior on 30/06/16.
//  Copyright © 2016 Michal Tynior. All rights reserved.
//

import Foundation

public class StarbirdTask: StarbirdTaskType {
    
    public var name: String = ""
    
    public var executionBlock: StarbirdTaskExecutionBlock?
    
    public init(name: String, executionBlock: StarbirdTaskExecutionBlock?) {
        self.name = name
        self.executionBlock = executionBlock
    }
    
    public func execute(with parameters: [String: Any]? = nil) {
        executionBlock?()
    }
    
}
