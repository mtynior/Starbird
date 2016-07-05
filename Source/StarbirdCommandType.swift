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
    
    func executeNext(context: StarbirdCommandContext?)
    
    mutating func continueWith(_ command: StarbirdCommandType)
    
}

extension StarbirdCommandType {
    
    func execute(context: StarbirdCommandContext? = nil) {
        if let nextCommand = nextCommand {
            nextCommand.execute(context: context)
        }
    }
    
    func executeNext(context: StarbirdCommandContext?) {
        if let nextCommand = nextCommand {
            nextCommand.execute(context: context)
        }

    }

    mutating func continueWith(_ command: StarbirdCommandType) {
        self.nextCommand = command
    }
    
}
