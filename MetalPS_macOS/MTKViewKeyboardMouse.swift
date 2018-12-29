//
//  MTKViewKeyboardMouse.swift
//  MetalPS_macOS
//
//  Created by 杨世玲 on 2018/12/29.
//  Copyright © 2018 杨世玲. All rights reserved.
//

import Foundation
import MetalKit

extension MTKView
{
    override open var acceptsFirstResponder: Bool {
        get {
            return true
        }
    }
    
    override open func keyDown(with event: NSEvent) {
        switch(event.characters!) {
        case "w":
            self.onMoveUp()
            break
        case "s":
            self.onMoveDown()
            break
        case "a":
            self.onMoveLeft()
            break
        case "d":
            self.onMoveRight()
            break
        case "r":
            self.onResetAll()
        default:
            break
        }
        print("\(event.characters!)")
    }
    
    override open func mouseDown(with event: NSEvent) {
        print("mousedown")
    }
    
    override open func rightMouseDown(with event: NSEvent) {
        print("right mouse")
    }
    
    override open func otherMouseDown(with event: NSEvent) {
        print("other mousss")
    }
    
    override open func scrollWheel(with event: NSEvent) {
        NotificationCenter.default.post(name: NotificationName.onScale, object: event.deltaY)
    }
    
    func onMoveUp()
    {
        NotificationCenter.default.post(name: NotificationName.onMoveY, object: Float(0.1))
    }
    
    func onMoveDown()
    {
        NotificationCenter.default.post(name: NotificationName.onMoveY, object: Float(-0.1))
    }
    
    func onMoveLeft()
    {
        NotificationCenter.default.post(name: NotificationName.onMoveX, object: Float(-0.1))
    }
    
    func onMoveRight()
    {
        NotificationCenter.default.post(name: NotificationName.onMoveX, object: Float(0.1))
    }
    
    func onResetAll()
    {
        
    }
}
