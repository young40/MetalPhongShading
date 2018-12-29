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
        print("keydown")
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
}
