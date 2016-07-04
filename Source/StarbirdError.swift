//
//  StarbirdError.swift
//  Starbird
//
//  Created by Michal Tynior on 04/07/2016.
//  Copyright © 2016 Michal Tynior. All rights reserved.
//

import Foundation

enum StarbirdError: ErrorProtocol, CustomStringConvertible {
    
    case TaskAlreadyDefined(name: String)
    case TaskNotFound(name: String)
    
}


extension StarbirdError {
    
    var description: String {
        
        switch self {
        case .TaskAlreadyDefined(let name): return "Task `\(name)` is already defined"
        case .TaskNotFound(let name): return "Task `\(name)` is not defined"
        }
        
    }
    
}
