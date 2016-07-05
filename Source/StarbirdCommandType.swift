//
//  StarbirdCommandType.swift
//  Starbird
//
//  Created by Michal Tynior on 05/07/2016.
//  Copyright © 2016 Michal Tynior. All rights reserved.
//

import Foundation

public protocol StarbirdCommandType {
    
    var nextCommand: StarbirdCommandType? { get set }
    
    func execute(context: StarbirdCommandContext?)
    
    func continueWith(_ command: StarbirdCommandType)
    
}

extension StarbirdCommandType {
    
    func execute(context: StarbirdCommandContext) {
        if let nextCommand = nextCommand {
            nextCommand.execute(context: context)
        }
    }
    
    mutating func continueWith(_ command: StarbirdCommandType) {
        nextCommand = command
    }
    
}
