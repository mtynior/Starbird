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
        return pipe(command)
    }
    
    @discardableResult public func pipe(_ command: StarbirdCommandType) -> Pipeline {
        
        if var lastCommand = commands.last {
            lastCommand.continueWith(command)
        }
        
        commands.append(command)
        
        return self
    }
    
    @discardableResult public func pipe(_ commands: [StarbirdCommandType]) -> Pipeline {
        
        for command in commands {
            pipe(command)
        }
        
        return self
    }
    
    @discardableResult public func pipe(_ pipeline: Pipeline) -> Pipeline {
        
        pipe(pipeline.commands)
        
        return self
    }
    
    public func run() {
        
        commands.first?.execute(context: StarbirdCommandContext())
    }
    
}
