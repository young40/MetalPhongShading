//
//  RenderNotification.swift
//  MetalPhongShading
//
//  Created by 杨世玲 on 2018/12/23.
//  Copyright © 2018 杨世玲. All rights reserved.
//

import Foundation

extension Renderer {
    func initNotification()
    {
        let notification = NotificationCenter.default
        
        notification.addObserver(self, selector: #selector(onSetStep(_:)),
                           name: NotificationName.onChange, object: nil)
        
        notification.addObserver(self, selector: #selector(onLoadModel(_:)),
                           name: NotificationName.onLoadModel, object: nil)
        
        notification.addObserver(self, selector: #selector(onScale(_:)),
                           name: NotificationName.onScale, object: nil)
        
        notification.addObserver(self, selector: #selector(onMoveX(_:)), name: NotificationName.onMoveX, object: nil)
        notification.addObserver(self, selector: #selector(onMoveY(_:)), name: NotificationName.onMoveY, object: nil)
    }
    
    @objc func onSetStep(_ notification: Notification)
    {
        if let data = notification.userInfo as? [String: Double]
        {
            self.step = Float(data["value"]!)
        }
    }
}
