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
        NotificationCenter.default.addObserver(self, selector: #selector(onSetStep(_:)), name: Notification.Name("onchange"), object: nil)
    }
    
    @objc func onSetStep(_ notification: Notification)
    {
        if let data = notification.userInfo as? [String: Double]
        {
            self.step = Float(data["value"]!)
        }
    }
}
