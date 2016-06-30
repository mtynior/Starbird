//
//  TaskType.swift
//  Starbird
//
//  Created by Michał Tynior on 30/06/16.
//  Copyright © 2016 Michal Tynior. All rights reserved.
//

import Foundation

public typealias TaskExecutionBlock = ( ([String: Any]?) -> Void )

public protocol TaskType {
    
    var name: String { get set }
    
    var executionBlock: TaskExecutionBlock? { get set }
    
    func execute(with parameters: [String: Any]?)
    
}
