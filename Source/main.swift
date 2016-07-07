//
//  main.swift
//  Starbird
//
//  Created by Michal Tynior on 30/06/2016.
//  Copyright © 2016 Michal Tynior. All rights reserved.
//

import Foundation

print("Hello from Starbird")

class Command1: StarbirdCommandType {
    
    var nextCommand: StarbirdCommandType?
    
    func execute(context: inout StarbirdCommandContext) {
        context.result = "Executing task 1\n"
        executeNextCommand(context: &context)
    }
    
}

class Command2: StarbirdCommandType {
    
    var nextCommand: StarbirdCommandType?
    
    func execute(context: inout StarbirdCommandContext) {
        var str = context.result as! String
        str.append("Executing task 2\n")
        context.result = str
        executeNextCommand(context: &context)
    }
    
}

class Command3: StarbirdCommandType {
    
    var nextCommand: StarbirdCommandType?
    
    func execute(context: inout  StarbirdCommandContext) {
        
        var str = context.result as! String
        str.append("Executing task 3\n")
        context.result = str
        
        executeNextCommand(context: &context)
    }
    
}

class Command4: StarbirdCommandType {
    
    var nextCommand: StarbirdCommandType?
    
    func execute(context: inout StarbirdCommandContext) {
        print(context.result as! String)
        executeNextCommand(context: &context)
    }
    
}

class Command5: StarbirdCommandType {
    
    var nextCommand: StarbirdCommandType?
    
    func execute(context: inout StarbirdCommandContext) {
        print("Command 5")
        executeNextCommand(context: &context)
    }
    
}


let starbird = Starbird()
 
starbird.addTask(named: "task1") { pipeline in
    return pipeline.addPipe(Command1())
}
 
starbird.addTask(named: "task2") { pipeline in
    return pipeline.addPipe(Command1())
                .addPipe(Command2())
                .addPipe(Command3())
                .addPipe(Command4())
}

starbird.addTask(named: "task3") { pipeline in
    return pipeline.addPipe(Command3())
}


// execute

starbird.startTask(named: "task2")

/*starbird.startTask(named: "task1", beforeExecute: { pipeline in
    return pipeline.addPipe(Command2())
})*/

/*starbird.startTask(named: "task1", afterExecute: { pipeline in
    return pipeline.addPipe(Command2())
})*/

/*starbird.startTask(named: "task2", beforeExecute: { pipeline in
    return pipeline.addPipe(Command1())
}, afterExecute: { pipeline in
    return pipeline.addPipe(Command3())
})*/

