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
    
    func execute(context: inout StarbirdCommandContext)
    
    func executeNext(context: inout StarbirdCommandContext)
    
    mutating func continueWith(_ command: StarbirdCommandType)
    
}

extension StarbirdCommandType {
    
    func execute(context: inout StarbirdCommandContext) {
        if let nextCommand = nextCommand {
            nextCommand.execute(context: &context)
        }
    }
    
    func executeNext(context: inout StarbirdCommandContext) {
        if let nextCommand = nextCommand {
            nextCommand.execute(context: &context)
        }
    }

    mutating func continueWith(_ command: StarbirdCommandType) {
        self.nextCommand = command
    }
    
}
