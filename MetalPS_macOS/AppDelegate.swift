//
//  AppDelegate.swift
//  MetalPhongShading macOS
//
//  Created by 杨世玲 on 2018/12/21.
//  Copyright © 2018 杨世玲. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBAction func onOpenFile(_ sender: NSMenuItem) {
        NotificationCenter.default.post(Notification(name: NotificationName.onOpenFile))
    }
    
    @IBAction func onExportPNG(_ sender: NSMenuItem) {
        NotificationCenter.default.post(Notification(name: NotificationName.onExportPNG))
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }


}

