//
//  Pipeline.swift
//  Starbird
//
//  Created by Michal Tynior on 05/07/2016.
//  Copyright © 2016 Michal Tynior. All rights reserved.
//

import Foundation

public class Pipeline {
    
    public var commands: [StarbirdCommandType] = []
    
    public init() { }
    
    public func start(with command: StarbirdCommandType) -> Pipeline {
        return addPipe(command)
    }
    
    @discardableResult public func addPipe(_ command: StarbirdCommandType) -> Pipeline {
        
        if var lastCommand = commands.last {
            lastCommand.continueWith(command)
        }
        
        commands.append(command)
        
        return self
    }
    
    @discardableResult public func addPipes(_ commands: [StarbirdCommandType]) -> Pipeline {
        
        for command in commands {
            addPipe(command)
        }
        
        return self
    }
    
    public func run() {
        var context = StarbirdCommandContext()
        
        commands.first?.execute(context: &context)
    }
    
}
