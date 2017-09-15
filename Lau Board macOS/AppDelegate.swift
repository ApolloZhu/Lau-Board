//
//  AppDelegate.swift
//  Lau Board macOS
//
//  Created by Apollo Zhu on 9/4/17.
//  Copyright © 2017 Ben Cullen. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
}
