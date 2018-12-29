//
//  RenderOperation.swift
//  MetalPhongShading
//
//  Created by 杨世玲 on 2018/12/29.
//  Copyright © 2018 杨世玲. All rights reserved.
//

import Foundation
import MetalKit
import simd

extension Renderer
{
    @objc func onScale(_ notification: Notification)
    {
        guard let scale = notification.object as? Float else {
            return
        }
        
        self.scale += scale
        
        if(self.scale < -100)
        {
            self.scale = -100
        }
        
        if(self.scale > 100)
        {
            self.scale = 100
        }
    }
    
    @objc func onMoveX(_ notification: Notification)
    {
        guard let offset = notification.object as? Float else {
            return
        }
        
        self.offsetX += offset
    }
    
    @objc func onMoveY(_ notification: Notification)
    {
        guard let offset = notification.object as? Float else {
            return
        }
        
        self.offsetY += offset
    }
}
