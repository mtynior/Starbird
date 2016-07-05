//
//  Pipeline.swift
//  Starbird
//
//  Created by Michal Tynior on 05/07/2016.
//  Copyright © 2016 Michal Tynior. All rights reserved.
//

import Foundation

public class Pipeline {
    
    private var _commands: [StarbirdCommandType] = []
    
    public init() { }
    
    public func start(with command: StarbirdCommandType) -> Pipeline {
        return pipe(command)
    }
    
    public func pipe(_ command: StarbirdCommandType) -> Pipeline {
        
        if let lastCommand = _commands.last {
            lastCommand.continueWith(command)
        }
        
        _commands.append(command)
        
        return self
    }
    
    public func run() {
        
        _commands.first?.execute(context: StarbirdCommandContext())
        
    }
    
}
