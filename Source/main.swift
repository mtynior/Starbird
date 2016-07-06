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
    
    func execute(context: StarbirdCommandContext? = nil) {
        print("Command 1")
        executeNext(context: context)
    }
    
}

class Command2: StarbirdCommandType {
    
    var nextCommand: StarbirdCommandType?
    
    func execute(context: StarbirdCommandContext? = nil) {
        print("Command 2")
        executeNext(context: context)
    }
    
}

class Command3: StarbirdCommandType {
    
    var nextCommand: StarbirdCommandType?
    
    func execute(context: StarbirdCommandContext? = nil) {
        print("Command 3")
        executeNext(context: context)
    }
    
}

class Command4: StarbirdCommandType {
    
    var nextCommand: StarbirdCommandType?
    
    func execute(context: StarbirdCommandContext? = nil) {
        print("Command 4")
        executeNext(context: context)
    }
    
}

class Command5: StarbirdCommandType {
    
    var nextCommand: StarbirdCommandType?
    
    func execute(context: StarbirdCommandContext? = nil) {
        print("Command 5")
        executeNext(context: context)
    }
    
}


let starbird = Starbird()
 
starbird.addTask(named: "task1") { pipeline in
    return pipeline.pipe(Command1())
}
 
starbird.addTask(named: "task2") { pipeline in
    return pipeline.pipe(Command2())
                .pipe(Command4())
                .pipe(Command5())
}

starbird.addTask(named: "task3") { pipeline in
    return pipeline.pipe(Command3())
}


// execute

starbird.startTask(named: "task2")

/*starbird.startTask(named: "task1", beforeExecute: { pipeline in
    return pipeline.pipe(Command2())
})*/

/*starbird.startTask(named: "task1", afterExecute: { pipeline in
    return pipeline.pipe(Command2())
})*/

/*starbird.startTask(named: "task2", beforeExecute: { pipeline in
    return pipeline.pipe(Command1())
}, afterExecute: { pipeline in
    return pipeline.pipe(Command3())
})*/

//starbird.startTask(named: "task1", beforeExecute: ["task2", "task3"] )

//starbird.startTask(named: "task1", afterExecute: ["task2", "task3"])

//starbird.startTask(named: "task1", beforeExecute:  ["task2", "task3"], afterExecute: ["task4", "task3"])

/*starbird.startTask(named: "task1", beforeExecute: { _ in
    print("Task 1 haven't started yet")
}, afterExecute: ["task2"])
*/
 
/*starbird.startTask(named: "task1", beforeExecute:  ["task2"], afterExecute: { _ in
    print("Task 1 completed")
})*/
