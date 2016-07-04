//
//  BlockTask.swift
//  Starbird
//
//  Created by Michal Tynior on 01/07/2016.
//  Copyright © 2016 Michal Tynior. All rights reserved.
//

import Foundation

public class BlockTask: Task {
    
    private var _executionBlock: ( (Void) -> TaskResult? )?

    public init(execute: (Void) -> TaskResult?) {
        _executionBlock = execute
        super.init()
    }
    
    public override func main() {
        super.main()
        
        result = _executionBlock?()
        finish()
    }
    
}
