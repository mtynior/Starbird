//
//  StarbirdTaskType.swift
//  Starbird
//
//  Created by Michał Tynior on 30/06/16.
//  Copyright © 2016 Michal Tynior. All rights reserved.
//

import Foundation

public typealias StarbirdTaskExecutionBlock = ( ([String: Any]?) -> Void )

public protocol StarbirdTaskType {
    
    var name: String { get set }
    
    var executionBlock: StarbirdTaskExecutionBlock? { get set }
    
    func execute(with parameters: [String: Any]?)
    
}
