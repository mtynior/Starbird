//
//  StarbirdError.swift
//  Starbird
//
//  Created by Michal Tynior on 04/07/2016.
//  Copyright © 2016 Michal Tynior. All rights reserved.
//

import Foundation

enum StarbirdError: ErrorProtocol {
    
    case TaskNotFound(name: String)
    
}
