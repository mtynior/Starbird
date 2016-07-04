//
//  UI.swift
//  Starbird
//
//  Created by Michal Tynior on 04/07/2016.
//  Copyright © 2016 Michal Tynior. All rights reserved.
//

import Foundation

public class UI {
    
    public static func showError(_ message: String) {
        print("[Error] \(message)")
    }
    
    public static func showError(_ error: ErrorProtocol) {
        print("[Error] \(error)")
    }
    
    public static func showWarning(_ message: String) {
        print("[Warning] \(message)")
    }

    public static func showInfo(_ message: String) {
        print("[Info] \(message)")
    }

}
